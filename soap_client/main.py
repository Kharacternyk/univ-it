import json
from sys import stdin

from fire import Fire
from zeep import Client as SoapClient


class Client:
    def __init__(self):
        self._client = SoapClient("../soap_server/database.wsdl")

    def download(self, name):
        data = self._client.service.GetDatabase(name)
        return [
            {
                "name": table["name"],
                "columns": [
                    {
                        "name": column["name"],
                        "cells": column["cell"],
                    }
                    for column in table.column
                ],
            }
            for table in data["table"]
        ]

    def upload(self, name):
        data = json.load(stdin)
        return self._client.service.CreateDatabase(
            name,
            table=[
                {
                    "name": table["name"],
                    "column": [
                        {"name": column["name"], "cell": column["cells"]}
                        for column in table["columns"]
                    ],
                }
                for table in data
            ],
        )

    def diff(self, name, left, right):
        return self._client.service.TableDifference(name, left, right)


if __name__ == "__main__":
    Fire(Client())

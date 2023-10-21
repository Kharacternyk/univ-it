import json
from sys import stdin

from fire import Fire
import grpc

from database_pb2 import (
    Cell,
    Column,
    ColumnType,
    Database,
    DatabaseHandle,
    NamedDatabase,
    Table,
    TableDiff,
)
from database_pb2_grpc import DatabaseServiceStub


class Client:
    def __init__(self):
        self._stub = DatabaseServiceStub(grpc.insecure_channel("localhost:8123"))

    def download(self, name: str):
        return self._stub.DownloadDatabase(DatabaseHandle(name=name))

    def upload(self, name: str):
        data = json.load(stdin)
        database = Database(
            tables=[
                Table(
                    name=table["name"],
                    columns=[
                        Column(
                            name=column["name"],
                            type=ColumnType.stringColumn
                            if column["type"] == "s"
                            else ColumnType.integerColumn,
                            cells=[
                                Cell(stringValue=cell)
                                if column["type"] == "s"
                                else Cell(integerValue=cell)
                                for cell in column["cells"]
                            ],
                        )
                        for column in table["columns"]
                    ],
                )
                for table in data
            ]
        )
        self._stub.UploadDatabase(NamedDatabase(name=name, database=database))

    def delete(self, name: str):
        self._stub.DeleteDatabase(DatabaseHandle(name=name))

    def diff(self, name: str, left: int, right: int):
        self._stub.DiffTables(
            TableDiff(
                database=DatabaseHandle(name=name),
                leftTableIndex=left,
                rightTableIndex=right,
            )
        )


if __name__ == "__main__":
    Fire(Client())

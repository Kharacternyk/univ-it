from json import dumps

from Pyro5.server import expose, serve
from requests import delete, get, post, put


@expose
class Database:
    def __init__(self, name):
        self._url = f"http://localhost:8123/databases/{name}"
        if get(self._url).status_code == 404:
            put(self._url)

    def delete(self):
        delete(self._url)
        put(self._url)

    def get_tables(self):
        return get(self._url).json()

    def diff_tables(self, left_table_index, right_table_index):
        post(
            f"{self._url}/tables/{left_table_index}",
            dumps({"removeFrom": right_table_index}),
        )

    def create_table(self):
        return put(f"{self._url}/tables").json()["index"]

    def rename_table(self, index, name):
        post(f"{self._url}/tables/{index}", dumps({"name": name}))

    def create_column(self, index, type_code):
        return put(
            f"{self._url}/tables/{index}/columns", dumps({"type": type_code})
        ).json()["index"]

    def rename_column(self, table_index, column_index, name):
        post(
            f"{self._url}/tables/{table_index}/columns/{column_index}",
            dumps({"name": name}),
        )

    def create_row(self, index):
        return put(f"{self._url}/tables/{index}/rows").json()["index"]

    def modify_cell(self, table_index, column_index, cell_index, value):
        post(
            f"{self._url}/tables/{table_index}/columns/{column_index}/cells/{cell_index}",
            dumps(value),
        )


serve({Database("remote.json"): "database"})

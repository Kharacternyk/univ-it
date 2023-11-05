from Pyro5.api import Proxy

from fire import Fire


class DatabaseProxy:
    def __init__(self):
        self._proxy = Proxy("pyroname:database")

    def delete(self):
        return self._proxy.delete()

    def get_tables(self):
        return self._proxy.get_tables()

    def diff_tables(self, left_table_index, right_table_index):
        return self._proxy.diff_tables(left_table_index, right_table_index)

    def create_table(self):
        return self._proxy.create_table()

    def rename_table(self, index, name):
        return self._proxy.rename_table(index, name)

    def create_column(self, index, type_code):
        return self._proxy.create_column(index, type_code)

    def rename_column(self, table_index, column_index, name):
        return self._proxy.rename_column(table_index, column_index, name)

    def create_row(self, index):
        return self._proxy.create_row(index)

    def modify_cell(self, table_index, column_index, cell_index, value):
        return self._proxy.modify_cell(table_index, column_index, cell_index, value)


if __name__ == "__main__":
    Fire(DatabaseProxy())

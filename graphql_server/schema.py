from typing import Optional, Union

import strawberry
from swagger_client import DefaultApi

api = DefaultApi()


@strawberry.type
class IntegerCell:
    value: int


@strawberry.type
class StringCell:
    value: str


@strawberry.type
class Column:
    name: str
    type: str
    cells: list[Union[IntegerCell, StringCell]]


@strawberry.type
class Table:
    name: str
    columns: list[Column]


@strawberry.type
class Database:
    tables: list[Table]


@strawberry.type
class Query:
    @strawberry.field
    def database(self, name: str) -> Database:
        database = api.get_database(name)
        return Database(
            tables=[
                Table(
                    name=table.name,
                    columns=[
                        Column(
                            name=column.name,
                            type=column.type,
                            cells=[
                                IntegerCell(value=value)
                                if column.type == "i"
                                else StringCell(value=value)
                                for value in column.cells
                            ],
                        )
                        for column in table.columns
                    ],
                )
                for table in database
            ]
        )


@strawberry.type
class Mutation:
    @strawberry.field
    def create_database(self, name: str) -> None:
        api.create_database(name)

    @strawberry.field
    def create_table(self, database_name: str, table_name: str) -> int:
        index = api.create_table(database_name).index
        api.modify_table(database_name, index, body={"name": table_name})
        return index

    @strawberry.field
    def create_column(
        self, database_name: str, table_index: int, column_name: str, column_type: str
    ) -> int:
        index = api.create_column(
            database_name, table_index, body={"type": column_type}
        ).index
        api.modify_column(database_name, table_index, index, body={"name": column_name})
        return index

    @strawberry.field
    def create_row(self, database_name: str, table_index: int) -> int:
        return api.create_row(database_name, table_index).index

    @strawberry.field
    def modify_cell(
        self,
        database_name: str,
        table_index: int,
        row_index: int,
        cell_index: int,
        integer: Optional[int] = None,
        string: Optional[str] = None,
    ) -> None:
        value = integer or string
        api.modify_cell(database_name, table_index, row_index, cell_index, body=value)

    @strawberry.field
    def table_difference(
        self, database_name: str, modified_table_index: int, other_table_index: int
    ) -> None:
        api.modify_table(
            database_name, modified_table_index, body={"removeFrom": other_table_index}
        )


schema = strawberry.Schema(query=Query, mutation=Mutation)

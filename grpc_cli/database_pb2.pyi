from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class ColumnType(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = []
    stringColumn: _ClassVar[ColumnType]
    integerColumn: _ClassVar[ColumnType]
stringColumn: ColumnType
integerColumn: ColumnType

class TableDiff(_message.Message):
    __slots__ = ["database", "leftTableIndex", "rightTableIndex"]
    DATABASE_FIELD_NUMBER: _ClassVar[int]
    LEFTTABLEINDEX_FIELD_NUMBER: _ClassVar[int]
    RIGHTTABLEINDEX_FIELD_NUMBER: _ClassVar[int]
    database: DatabaseHandle
    leftTableIndex: int
    rightTableIndex: int
    def __init__(self, database: _Optional[_Union[DatabaseHandle, _Mapping]] = ..., leftTableIndex: _Optional[int] = ..., rightTableIndex: _Optional[int] = ...) -> None: ...

class DatabaseHandle(_message.Message):
    __slots__ = ["name"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    name: str
    def __init__(self, name: _Optional[str] = ...) -> None: ...

class NamedDatabase(_message.Message):
    __slots__ = ["name", "database"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    DATABASE_FIELD_NUMBER: _ClassVar[int]
    name: str
    database: Database
    def __init__(self, name: _Optional[str] = ..., database: _Optional[_Union[Database, _Mapping]] = ...) -> None: ...

class Database(_message.Message):
    __slots__ = ["tables"]
    TABLES_FIELD_NUMBER: _ClassVar[int]
    tables: _containers.RepeatedCompositeFieldContainer[Table]
    def __init__(self, tables: _Optional[_Iterable[_Union[Table, _Mapping]]] = ...) -> None: ...

class Table(_message.Message):
    __slots__ = ["name", "columns"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    COLUMNS_FIELD_NUMBER: _ClassVar[int]
    name: str
    columns: _containers.RepeatedCompositeFieldContainer[Column]
    def __init__(self, name: _Optional[str] = ..., columns: _Optional[_Iterable[_Union[Column, _Mapping]]] = ...) -> None: ...

class Column(_message.Message):
    __slots__ = ["name", "type", "cells"]
    NAME_FIELD_NUMBER: _ClassVar[int]
    TYPE_FIELD_NUMBER: _ClassVar[int]
    CELLS_FIELD_NUMBER: _ClassVar[int]
    name: str
    type: ColumnType
    cells: _containers.RepeatedCompositeFieldContainer[Cell]
    def __init__(self, name: _Optional[str] = ..., type: _Optional[_Union[ColumnType, str]] = ..., cells: _Optional[_Iterable[_Union[Cell, _Mapping]]] = ...) -> None: ...

class Cell(_message.Message):
    __slots__ = ["stringValue", "integerValue"]
    STRINGVALUE_FIELD_NUMBER: _ClassVar[int]
    INTEGERVALUE_FIELD_NUMBER: _ClassVar[int]
    stringValue: str
    integerValue: int
    def __init__(self, stringValue: _Optional[str] = ..., integerValue: _Optional[int] = ...) -> None: ...

class Void(_message.Message):
    __slots__ = []
    def __init__(self) -> None: ...

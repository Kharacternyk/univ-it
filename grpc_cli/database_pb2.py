# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: database.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x0e\x64\x61tabase.proto\"_\n\tTableDiff\x12!\n\x08\x64\x61tabase\x18\x01 \x01(\x0b\x32\x0f.DatabaseHandle\x12\x16\n\x0eleftTableIndex\x18\x02 \x01(\r\x12\x17\n\x0frightTableIndex\x18\x03 \x01(\r\"\x1e\n\x0e\x44\x61tabaseHandle\x12\x0c\n\x04name\x18\x01 \x01(\t\":\n\rNamedDatabase\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x1b\n\x08\x64\x61tabase\x18\x02 \x01(\x0b\x32\t.Database\"\"\n\x08\x44\x61tabase\x12\x16\n\x06tables\x18\x01 \x03(\x0b\x32\x06.Table\"/\n\x05Table\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x18\n\x07\x63olumns\x18\x02 \x03(\x0b\x32\x07.Column\"G\n\x06\x43olumn\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x19\n\x04type\x18\x02 \x01(\x0e\x32\x0b.ColumnType\x12\x14\n\x05\x63\x65lls\x18\x03 \x03(\x0b\x32\x05.Cell\">\n\x04\x43\x65ll\x12\x15\n\x0bstringValue\x18\x01 \x01(\tH\x00\x12\x16\n\x0cintegerValue\x18\x02 \x01(\x05H\x00\x42\x07\n\x05value\"\x06\n\x04Void*1\n\nColumnType\x12\x10\n\x0cstringColumn\x10\x00\x12\x11\n\rintegerColumn\x10\x01\x32\xbd\x01\n\x0f\x44\x61tabaseService\x12\x30\n\x10\x44ownloadDatabase\x12\x0f.DatabaseHandle\x1a\t.Database\"\x00\x12)\n\x0eUploadDatabase\x12\x0e.NamedDatabase\x1a\x05.Void\"\x00\x12*\n\x0e\x44\x65leteDatabase\x12\x0f.DatabaseHandle\x1a\x05.Void\"\x00\x12!\n\nDiffTables\x12\n.TableDiff\x1a\x05.Void\"\x00\x62\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'database_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _globals['_COLUMNTYPE']._serialized_start=437
  _globals['_COLUMNTYPE']._serialized_end=486
  _globals['_TABLEDIFF']._serialized_start=18
  _globals['_TABLEDIFF']._serialized_end=113
  _globals['_DATABASEHANDLE']._serialized_start=115
  _globals['_DATABASEHANDLE']._serialized_end=145
  _globals['_NAMEDDATABASE']._serialized_start=147
  _globals['_NAMEDDATABASE']._serialized_end=205
  _globals['_DATABASE']._serialized_start=207
  _globals['_DATABASE']._serialized_end=241
  _globals['_TABLE']._serialized_start=243
  _globals['_TABLE']._serialized_end=290
  _globals['_COLUMN']._serialized_start=292
  _globals['_COLUMN']._serialized_end=363
  _globals['_CELL']._serialized_start=365
  _globals['_CELL']._serialized_end=427
  _globals['_VOID']._serialized_start=429
  _globals['_VOID']._serialized_end=435
  _globals['_DATABASESERVICE']._serialized_start=489
  _globals['_DATABASESERVICE']._serialized_end=678
# @@protoc_insertion_point(module_scope)

//
//  Generated code. Do not modify.
//  source: protos/database.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use columnTypeDescriptor instead')
const ColumnType$json = {
  '1': 'ColumnType',
  '2': [
    {'1': 'stringColumn', '2': 0},
    {'1': 'integerColumn', '2': 1},
  ],
};

/// Descriptor for `ColumnType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List columnTypeDescriptor = $convert.base64Decode(
    'CgpDb2x1bW5UeXBlEhAKDHN0cmluZ0NvbHVtbhAAEhEKDWludGVnZXJDb2x1bW4QAQ==');

@$core.Deprecated('Use tableDiffDescriptor instead')
const TableDiff$json = {
  '1': 'TableDiff',
  '2': [
    {'1': 'database', '3': 1, '4': 1, '5': 11, '6': '.DatabaseHandle', '10': 'database'},
    {'1': 'leftTableIndex', '3': 2, '4': 1, '5': 13, '10': 'leftTableIndex'},
    {'1': 'rightTableIndex', '3': 3, '4': 1, '5': 13, '10': 'rightTableIndex'},
  ],
};

/// Descriptor for `TableDiff`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tableDiffDescriptor = $convert.base64Decode(
    'CglUYWJsZURpZmYSKwoIZGF0YWJhc2UYASABKAsyDy5EYXRhYmFzZUhhbmRsZVIIZGF0YWJhc2'
    'USJgoObGVmdFRhYmxlSW5kZXgYAiABKA1SDmxlZnRUYWJsZUluZGV4EigKD3JpZ2h0VGFibGVJ'
    'bmRleBgDIAEoDVIPcmlnaHRUYWJsZUluZGV4');

@$core.Deprecated('Use databaseHandleDescriptor instead')
const DatabaseHandle$json = {
  '1': 'DatabaseHandle',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DatabaseHandle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List databaseHandleDescriptor = $convert.base64Decode(
    'Cg5EYXRhYmFzZUhhbmRsZRISCgRuYW1lGAEgASgJUgRuYW1l');

@$core.Deprecated('Use namedDatabaseDescriptor instead')
const NamedDatabase$json = {
  '1': 'NamedDatabase',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'database', '3': 2, '4': 1, '5': 11, '6': '.Database', '10': 'database'},
  ],
};

/// Descriptor for `NamedDatabase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List namedDatabaseDescriptor = $convert.base64Decode(
    'Cg1OYW1lZERhdGFiYXNlEhIKBG5hbWUYASABKAlSBG5hbWUSJQoIZGF0YWJhc2UYAiABKAsyCS'
    '5EYXRhYmFzZVIIZGF0YWJhc2U=');

@$core.Deprecated('Use databaseDescriptor instead')
const Database$json = {
  '1': 'Database',
  '2': [
    {'1': 'tables', '3': 1, '4': 3, '5': 11, '6': '.Table', '10': 'tables'},
  ],
};

/// Descriptor for `Database`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List databaseDescriptor = $convert.base64Decode(
    'CghEYXRhYmFzZRIeCgZ0YWJsZXMYASADKAsyBi5UYWJsZVIGdGFibGVz');

@$core.Deprecated('Use tableDescriptor instead')
const Table$json = {
  '1': 'Table',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'columns', '3': 2, '4': 3, '5': 11, '6': '.Column', '10': 'columns'},
  ],
};

/// Descriptor for `Table`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tableDescriptor = $convert.base64Decode(
    'CgVUYWJsZRISCgRuYW1lGAEgASgJUgRuYW1lEiEKB2NvbHVtbnMYAiADKAsyBy5Db2x1bW5SB2'
    'NvbHVtbnM=');

@$core.Deprecated('Use columnDescriptor instead')
const Column$json = {
  '1': 'Column',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.ColumnType', '10': 'type'},
    {'1': 'cells', '3': 3, '4': 3, '5': 11, '6': '.Cell', '10': 'cells'},
  ],
};

/// Descriptor for `Column`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List columnDescriptor = $convert.base64Decode(
    'CgZDb2x1bW4SEgoEbmFtZRgBIAEoCVIEbmFtZRIfCgR0eXBlGAIgASgOMgsuQ29sdW1uVHlwZV'
    'IEdHlwZRIbCgVjZWxscxgDIAMoCzIFLkNlbGxSBWNlbGxz');

@$core.Deprecated('Use cellDescriptor instead')
const Cell$json = {
  '1': 'Cell',
  '2': [
    {'1': 'stringValue', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'integerValue', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'integerValue'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `Cell`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cellDescriptor = $convert.base64Decode(
    'CgRDZWxsEiIKC3N0cmluZ1ZhbHVlGAEgASgJSABSC3N0cmluZ1ZhbHVlEiQKDGludGVnZXJWYW'
    'x1ZRgCIAEoBUgAUgxpbnRlZ2VyVmFsdWVCBwoFdmFsdWU=');

@$core.Deprecated('Use voidDescriptor instead')
const Void$json = {
  '1': 'Void',
};

/// Descriptor for `Void`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voidDescriptor = $convert.base64Decode(
    'CgRWb2lk');


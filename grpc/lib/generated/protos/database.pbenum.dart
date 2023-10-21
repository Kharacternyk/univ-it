//
//  Generated code. Do not modify.
//  source: protos/database.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ColumnType extends $pb.ProtobufEnum {
  static const ColumnType stringColumn = ColumnType._(0, _omitEnumNames ? '' : 'stringColumn');
  static const ColumnType integerColumn = ColumnType._(1, _omitEnumNames ? '' : 'integerColumn');

  static const $core.List<ColumnType> values = <ColumnType> [
    stringColumn,
    integerColumn,
  ];

  static final $core.Map<$core.int, ColumnType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ColumnType? valueOf($core.int value) => _byValue[value];

  const ColumnType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

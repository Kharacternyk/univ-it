//
//  Generated code. Do not modify.
//  source: protos/database.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'database.pb.dart' as $0;

export 'database.pb.dart';

@$pb.GrpcServiceName('DatabaseService')
class DatabaseServiceClient extends $grpc.Client {
  static final _$downloadDatabase = $grpc.ClientMethod<$0.DatabaseHandle, $0.Database>(
      '/DatabaseService/DownloadDatabase',
      ($0.DatabaseHandle value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Database.fromBuffer(value));
  static final _$uploadDatabase = $grpc.ClientMethod<$0.NamedDatabase, $0.Void>(
      '/DatabaseService/UploadDatabase',
      ($0.NamedDatabase value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Void.fromBuffer(value));
  static final _$deleteDatabase = $grpc.ClientMethod<$0.DatabaseHandle, $0.Void>(
      '/DatabaseService/DeleteDatabase',
      ($0.DatabaseHandle value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Void.fromBuffer(value));
  static final _$diffTables = $grpc.ClientMethod<$0.TableDiff, $0.Void>(
      '/DatabaseService/DiffTables',
      ($0.TableDiff value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Void.fromBuffer(value));

  DatabaseServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Database> downloadDatabase($0.DatabaseHandle request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$downloadDatabase, request, options: options);
  }

  $grpc.ResponseFuture<$0.Void> uploadDatabase($0.NamedDatabase request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uploadDatabase, request, options: options);
  }

  $grpc.ResponseFuture<$0.Void> deleteDatabase($0.DatabaseHandle request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDatabase, request, options: options);
  }

  $grpc.ResponseFuture<$0.Void> diffTables($0.TableDiff request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$diffTables, request, options: options);
  }
}

@$pb.GrpcServiceName('DatabaseService')
abstract class DatabaseServiceBase extends $grpc.Service {
  $core.String get $name => 'DatabaseService';

  DatabaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DatabaseHandle, $0.Database>(
        'DownloadDatabase',
        downloadDatabase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DatabaseHandle.fromBuffer(value),
        ($0.Database value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NamedDatabase, $0.Void>(
        'UploadDatabase',
        uploadDatabase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.NamedDatabase.fromBuffer(value),
        ($0.Void value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DatabaseHandle, $0.Void>(
        'DeleteDatabase',
        deleteDatabase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DatabaseHandle.fromBuffer(value),
        ($0.Void value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TableDiff, $0.Void>(
        'DiffTables',
        diffTables_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TableDiff.fromBuffer(value),
        ($0.Void value) => value.writeToBuffer()));
  }

  $async.Future<$0.Database> downloadDatabase_Pre($grpc.ServiceCall call, $async.Future<$0.DatabaseHandle> request) async {
    return downloadDatabase(call, await request);
  }

  $async.Future<$0.Void> uploadDatabase_Pre($grpc.ServiceCall call, $async.Future<$0.NamedDatabase> request) async {
    return uploadDatabase(call, await request);
  }

  $async.Future<$0.Void> deleteDatabase_Pre($grpc.ServiceCall call, $async.Future<$0.DatabaseHandle> request) async {
    return deleteDatabase(call, await request);
  }

  $async.Future<$0.Void> diffTables_Pre($grpc.ServiceCall call, $async.Future<$0.TableDiff> request) async {
    return diffTables(call, await request);
  }

  $async.Future<$0.Database> downloadDatabase($grpc.ServiceCall call, $0.DatabaseHandle request);
  $async.Future<$0.Void> uploadDatabase($grpc.ServiceCall call, $0.NamedDatabase request);
  $async.Future<$0.Void> deleteDatabase($grpc.ServiceCall call, $0.DatabaseHandle request);
  $async.Future<$0.Void> diffTables($grpc.ServiceCall call, $0.TableDiff request);
}

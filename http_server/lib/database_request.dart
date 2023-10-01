import 'dart:convert';
import 'dart:io';

import 'package:core/database.dart';
import 'package:shelf/shelf.dart';

extension DatabaseRequest on Request {
  Future<Response> withDatabase(
    String databaseName,
    Future<Response> Function(Database database, Object? body) callback,
  ) async {
    final Object? bodyJson;
    final bodyString = await readAsString();

    try {
      bodyJson = bodyString.isNotEmpty ? jsonDecode(bodyString) : null;
    } on FormatException {
      return Response.badRequest();
    }

    final file = File(databaseName);
    final String databaseJson;

    try {
      databaseJson = await file.readAsString();
    } on FileSystemException {
      return Response.notFound(null);
    }

    final database = Database.fromJson(jsonDecode(databaseJson));
    final response = await callback(database, bodyJson);

    if (response.statusCode == 200 && method != "GET") {
      await file.writeAsString(jsonEncode(database));
    }

    return response;
  }
}

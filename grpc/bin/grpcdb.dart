import 'package:grpc/grpc.dart';
import 'package:grpcdb/database_service.dart';

void main(List<String> _) async {
  final server = Server.create(services: [DatabaseService()]);
  await server.serve(port: 8123);
}

import 'package:flutter/material.dart' hide Table;
import 'package:grpc/grpc.dart';
import 'package:grpcdb/generated/protos/database.pbgrpc.dart';

import 'table_scaffold.dart';

class DatabaseScaffold extends StatefulWidget {
  const DatabaseScaffold({super.key});

  @override
  createState() => _State();
}

class _State extends State<DatabaseScaffold> {
  static const name = 'Database.json';
  Database? database;
  ValueNotifier<Table>? table;

  final stub = DatabaseServiceClient(ClientChannel(
    'localhost',
    port: 8123,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  ));

  @override
  initState() {
    super.initState();
    _downloadDatabase();
  }

  @override
  dispose() {
    table?.dispose();
    super.dispose();
  }

  @override
  build(context) {
    final table = this.table;
    final database = this.database;

    if (table == null || database == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ValueListenableBuilder(
      valueListenable: table,
      builder: (context, currentTable, child) {
        return TableScaffold(
          currentTable,
          drawer: Builder(
            builder: (context) {
              return Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.download),
                      title: const Text('Download Database'),
                      onTap: _downloadDatabase,
                    ),
                    ListTile(
                      leading: const Icon(Icons.upload),
                      title: const Text('Upload Database'),
                      onTap: () {
                        stub.uploadDatabase(
                          NamedDatabase(name: name, database: database),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Create Table'),
                      onTap: () {
                        setState(() {
                          database.tables.add(Table()..name = 'New Table');
                        });
                      },
                    ),
                    const Divider(),
                    for (final table in database.tables)
                      ListTile(
                        leading: const Icon(Icons.table_view),
                        title: Text(table.name),
                        trailing: currentTable == table
                            ? const BackButtonIcon()
                            : IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    database.tables.remove(table);
                                  });
                                },
                              ),
                        onTap: () {
                          this.table?.value = table;
                        },
                      ),
                  ],
                ),
              );
            },
          ),
          diffTable: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return SimpleDialog(children: [
                  for (var i = 0; i < database.tables.length; ++i)
                    SimpleDialogOption(
                      child: Text(database.tables[i].name),
                      onPressed: () {
                        Navigator.pop(context);
                        stub.diffTables(
                          TableDiff(
                            leftTableIndex:
                                database.tables.indexOf(currentTable),
                            rightTableIndex: i,
                            database: DatabaseHandle(name: name),
                          ),
                        );
                      },
                    )
                ]);
              },
            );
          },
        );
      },
    );
  }

  void _downloadDatabase() {
    stub.downloadDatabase(DatabaseHandle(name: name)).then((database) {
      setState(() {
        this.database = database;

        if (database.tables.isEmpty) {
          database.tables.add(Table()..name = 'New Table');
        }

        table = ValueNotifier(database.tables.first);
      });
    });
  }
}

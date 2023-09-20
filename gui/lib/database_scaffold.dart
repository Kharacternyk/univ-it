import 'dart:convert';
import 'dart:io';

import 'package:core/database.dart';
import 'package:core/table.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart' hide Table;
import 'package:path/path.dart';

import 'table_scaffold.dart';

class DatabaseScaffold extends StatefulWidget {
  const DatabaseScaffold({super.key});

  @override
  createState() => _State();
}

class _State extends State<DatabaseScaffold> {
  var path = 'Database.json';
  late var database = Database()..tables.add(Table());
  late final table = ValueNotifier<Table>(database.tables.first);

  @override
  dispose() {
    table.dispose();
    super.dispose();
  }

  @override
  build(context) {
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
                      leading: const Icon(Icons.file_open),
                      title: const Text('Open Database'),
                      onTap: () async {
                        final location = await openFile(acceptedTypeGroups: [
                          const XTypeGroup(extensions: ['json'])
                        ]);

                        if (location != null) {
                          final path = location.path;
                          final content = await File(path).readAsString();

                          setState(() {
                            this.path = path;
                            database = Database.fromJson(
                              jsonDecode(content) as Object,
                            );

                            if (database.tables.isEmpty) {
                              database.tables.add(Table());
                            }
                          });

                          table.value = database.tables.first;
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.save),
                      title: const Text('Save Database'),
                      onTap: () async {
                        final location = await getSaveLocation(
                          suggestedName: basename(path),
                          initialDirectory: File(path).parent.path,
                        );

                        if (location != null) {
                          final path = location.path;
                          await File(path).writeAsString(jsonEncode(database));
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Create Table'),
                      onTap: () {
                        setState(() {
                          database.tables.add(Table());
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
                          this.table.value = table;
                        },
                      ),
                  ],
                ),
              );
            },
          ),
          selectTable: () {
            return showDialog<Table>(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  children: database.tables.map((table) {
                    return SimpleDialogOption(
                      child: Text(table.name),
                      onPressed: () {
                        Navigator.pop(context, table);
                      },
                    );
                  }).toList(),
                );
              },
            );
          },
        );
      },
    );
  }
}

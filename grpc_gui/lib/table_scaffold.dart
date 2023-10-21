import 'package:flutter/material.dart' hide Table, Column;
import 'package:grpcdb/generated/protos/database.pbgrpc.dart';

import 'column_scaffold.dart';

class TableScaffold extends StatefulWidget {
  final Table table;
  final Widget drawer;
  final VoidCallback diffTable;

  const TableScaffold(
    this.table, {
    required this.drawer,
    required this.diffTable,
    super.key,
  });

  @override
  createState() => _State();
}

class _State extends State<TableScaffold> {
  late final name = TextEditingController(text: widget.table.name);

  @override
  dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    name.text = widget.table.name;
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: name,
          decoration: const InputDecoration.collapsed(hintText: 'Table Name'),
          onChanged: (value) {
            widget.table.name = value;
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(
                  Column()
                    ..name = 'New Column'
                    ..type = ColumnType.integerColumn,
                ));
              });
            },
            icon: const Icon(Icons.onetwothree),
            tooltip: 'Integer',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(
                  Column()
                    ..name = 'New Column'
                    ..type = ColumnType.stringColumn,
                ));
              });
            },
            icon: const Icon(Icons.abc),
            tooltip: 'String',
          ),
          IconButton(
            onPressed: widget.diffTable,
            icon: const Icon(Icons.cleaning_services),
            tooltip: 'Table Difference',
          ),
        ],
      ),
      drawer: widget.drawer,
      body: Ink(
        padding: const EdgeInsets.all(4),
        child: ListView(
          children: [
            Row(
              children: [
                for (final column in widget.table.columns)
                  ColumnScaffold(
                    column,
                    delete: () {
                      setState(() {
                        widget.table.columns.remove(column);
                      });
                    },
                  )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            for (final column in widget.table.columns) {
              addDefault(column);
            }
          });
        },
      ),
    );
  }

  Column normalize(Column column) {
    final rowCount = widget.table.columns.firstOrNull?.cells.length ?? 0;

    for (var i = 0; i < rowCount; ++i) {
      addDefault(column);
    }

    return column;
  }

  static void addDefault(Column column) {
    column.cells.add(switch (column.type) {
      ColumnType.stringColumn => Cell(stringValue: ''),
      _ => Cell(integerValue: 0),
    });
  }
}

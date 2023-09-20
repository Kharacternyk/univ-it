import 'package:core/column.dart';
import 'package:core/table.dart';
import 'package:flutter/material.dart' hide Table, Column;

import 'column_scaffold.dart';

class TableScaffold extends StatefulWidget {
  final Table table;
  final Widget drawer;
  final Future<Table?> Function() selectTable;

  const TableScaffold(
    this.table, {
    required this.drawer,
    required this.selectTable,
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
                widget.table.columns.add(normalize(IntegerColumn()));
              });
            },
            icon: const Icon(Icons.onetwothree),
            tooltip: 'Integer',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(RealColumn()));
              });
            },
            icon: const Icon(Icons.straighten),
            tooltip: 'Real Number',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(CharacterColumn()));
              });
            },
            icon: const Icon(Icons.text_format),
            tooltip: 'Character',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(StringColumn()));
              });
            },
            icon: const Icon(Icons.abc),
            tooltip: 'String',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns.add(normalize(CharacterIntervalColumn()));
              });
            },
            icon: const Icon(Icons.text_rotate_vertical),
            tooltip: 'Character Interval',
          ),
          IconButton(
            onPressed: () {
              setState(() {
                widget.table.columns
                    .add(normalize(CharacterIntervalStringColumn()));
              });
            },
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: 'Character Interval String',
          ),
          IconButton(
            onPressed: () async {
              final table = await widget.selectTable();

              if (table != null) {
                setState(() {
                  widget.table.removeFrom(table);
                });
              }
            },
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
              column.addDefault();
            }
          });
        },
      ),
    );
  }

  Column<T> normalize<T>(Column<T> column) {
    final rowCount = widget.table.columns.firstOrNull?.cells.length ?? 0;

    for (var i = 0; i < rowCount; ++i) {
      column.addDefault();
    }

    return column;
  }
}

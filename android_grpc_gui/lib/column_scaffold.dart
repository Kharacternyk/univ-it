import 'package:flutter/material.dart' hide Column;
import 'package:flutter/material.dart' as material;
import 'package:grpcdb/generated/protos/database.pbgrpc.dart';

import 'integer_field.dart';
import 'string_field.dart';

class ColumnScaffold extends StatefulWidget {
  final Column column;
  final VoidCallback delete;

  const ColumnScaffold(this.column, {required this.delete, super.key});

  @override
  createState() => _State();
}

class _State extends State<ColumnScaffold> {
  late final name = TextEditingController(text: widget.column.name);

  @override
  dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    name.text = widget.column.name;
  }

  @override
  build(context) {
    return Expanded(
      child: material.Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                switch (widget.column.type) {
                  ColumnType.stringColumn => Icons.abc,
                  _ => Icons.onetwothree,
                },
              ),
              title: TextField(
                controller: name,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Column Name'),
                onChanged: (value) {
                  widget.column.name = value;
                },
              ),
              trailing: IconButton(
                onPressed: widget.delete,
                icon: const Icon(Icons.delete),
              ),
            ),
          ),
          ...switch (widget.column.type) {
            ColumnType.stringColumn => [
                for (var i = 0; i < widget.column.cells.length; ++i)
                  StringField(
                    widget.column.cells[i].stringValue,
                    (value) {
                      widget.column.cells[i].stringValue = value;
                    },
                  )
              ],
            _ => [
                for (var i = 0; i < widget.column.cells.length; ++i)
                  IntegerField(
                    widget.column.cells[i].integerValue,
                    (value) {
                      widget.column.cells[i].integerValue = value;
                    },
                  )
              ],
          }
              .map((widget) => Card(child: ListTile(title: widget))),
        ],
      ),
    );
  }
}

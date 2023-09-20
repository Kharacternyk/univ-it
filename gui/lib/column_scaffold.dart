import 'package:core/column.dart';
import 'package:flutter/material.dart' hide Column;
import 'package:flutter/material.dart' as material;

import 'character_field.dart';
import 'character_interval_field.dart';
import 'character_interval_string_field.dart';
import 'integer_field.dart';
import 'real_field.dart';
import 'string_field.dart';

class ColumnScaffold extends StatefulWidget {
  final Column<Object> column;
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
                switch (widget.column) {
                  IntegerColumn _ => Icons.onetwothree,
                  RealColumn _ => Icons.straighten,
                  CharacterColumn _ => Icons.text_format,
                  StringColumn _ => Icons.abc,
                  CharacterIntervalColumn _ => Icons.text_rotate_vertical,
                  CharacterIntervalStringColumn _ => Icons.sort_by_alpha,
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
          ...switch (widget.column) {
            IntegerColumn column => [
                for (var i = 0; i < column.cells.length; ++i)
                  IntegerField(
                    column.cells[i],
                    (value) {
                      column.cells[i] = value;
                    },
                  )
              ],
            RealColumn column => [
                for (var i = 0; i < column.cells.length; ++i)
                  RealField(
                    column.cells[i],
                    (value) {
                      column.cells[i] = value;
                    },
                  )
              ],
            CharacterColumn column =>
              column.cells.map(CharacterField.new).toList(),
            StringColumn column => [
                for (var i = 0; i < column.cells.length; ++i)
                  StringField(
                    column.cells[i],
                    (value) {
                      column.cells[i] = value;
                    },
                  )
              ],
            CharacterIntervalColumn column =>
              column.cells.map(CharacterIntervalField.new).toList(),
            CharacterIntervalStringColumn column =>
              column.cells.map(CharacterIntervalStringField.new).toList(),
          }
              .map((widget) => Card(child: ListTile(title: widget))),
        ],
      ),
    );
  }
}

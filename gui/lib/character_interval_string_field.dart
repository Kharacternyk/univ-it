import 'package:core/character_interval.dart';
import 'package:core/character_interval_string.dart';
import 'package:flutter/material.dart';

import 'character_interval_field.dart';

class CharacterIntervalStringField extends StatefulWidget {
  final CharacterIntervalString string;

  const CharacterIntervalStringField(this.string, {super.key});

  @override
  createState() => _State();
}

class _State extends State<CharacterIntervalStringField> {
  @override
  build(context) {
    return Row(
      children: [
        ...widget.string.intervals
            .map(CharacterIntervalField.new)
            .map((field) => Expanded(child: field)),
        const Spacer(),
        TextButton(
          onPressed: () {
            setState(() {
              widget.string.intervals.add(CharacterInterval());
            });
          },
          child: const Icon(Icons.add),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (widget.string.intervals.isNotEmpty) {
                widget.string.intervals.removeLast();
              }
            });
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

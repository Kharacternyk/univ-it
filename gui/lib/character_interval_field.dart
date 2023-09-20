import 'package:core/character_interval.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterIntervalField extends StatefulWidget {
  final CharacterInterval interval;

  const CharacterIntervalField(this.interval, {super.key});

  @override
  createState() => _State();
}

class _State extends State<CharacterIntervalField> {
  static const separator = '–';

  late final value = TextEditingController(text: _text);

  @override
  dispose() {
    value.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    value.text = _text;
  }

  String get _text => [
        widget.interval.start.value,
        widget.interval.end.value,
      ].join(separator);

  @override
  build(context) {
    return TextField(
      controller: value,
      decoration: const InputDecoration.collapsed(hintText: ''),
      inputFormatters: [
        TextInputFormatter.withFunction((old, current) {
          final parts = current.text.split(separator);

          if (parts case [String start, String end]) {
            if (start.length == 1 && end.length == 1) {
              final startCode = start.codeUnitAt(0);
              final endCode = end.codeUnitAt(0);

              if (startCode <= endCode) {
                widget.interval.start.code = startCode;
                widget.interval.end.code = endCode;

                return current;
              }
            }
          }

          return old;
        })
      ],
    );
  }
}

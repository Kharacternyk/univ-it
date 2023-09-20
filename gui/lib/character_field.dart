import 'package:core/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CharacterField extends StatefulWidget {
  final Character character;

  const CharacterField(this.character, {super.key});

  @override
  createState() => _State();
}

class _State extends State<CharacterField> {
  late final value = TextEditingController(text: widget.character.value);

  @override
  dispose() {
    value.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    value.text = widget.character.value;
  }

  @override
  build(context) {
    return TextField(
      controller: value,
      decoration: const InputDecoration.collapsed(hintText: ''),
      inputFormatters: [
        TextInputFormatter.withFunction((old, current) {
          if (current.text.length == 1) {
            widget.character.code = current.text.codeUnitAt(0);
            return current;
          }
          return old;
        })
      ],
    );
  }
}

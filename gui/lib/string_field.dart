import 'package:flutter/material.dart';

class StringField extends StatefulWidget {
  final String value;
  final void Function(String) setValue;

  const StringField(this.value, this.setValue, {super.key});

  @override
  createState() => _State();
}

class _State extends State<StringField> {
  late final value = TextEditingController(text: widget.value);

  @override
  dispose() {
    value.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    value.text = widget.value;
  }

  @override
  build(context) {
    return TextField(
      controller: value,
      decoration: const InputDecoration.collapsed(hintText: ''),
      onChanged: widget.setValue,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerField extends StatefulWidget {
  final int value;
  final void Function(int) setValue;

  const IntegerField(this.value, this.setValue, {super.key});

  @override
  createState() => _State();
}

class _State extends State<IntegerField> {
  late final value = TextEditingController(text: widget.value.toString());

  @override
  dispose() {
    value.dispose();
    super.dispose();
  }

  @override
  didUpdateWidget(old) {
    super.didUpdateWidget(old);
    value.text = widget.value.toString();
  }

  @override
  build(context) {
    return TextField(
      controller: value,
      decoration: const InputDecoration.collapsed(hintText: ''),
      inputFormatters: [
        TextInputFormatter.withFunction((old, current) {
          final value = int.tryParse(current.text);

          if (value != null) {
            widget.setValue(value);

            return current;
          }

          return old;
        })
      ],
    );
  }
}

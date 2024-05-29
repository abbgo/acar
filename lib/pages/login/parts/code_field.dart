import 'package:acar/helpers/static_data.dart';
import 'package:flutter/material.dart';

class CodeField extends StatelessWidget {
  const CodeField({super.key, required this.codeCtrl});

  final TextEditingController codeCtrl;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: codeCtrl,
      autofocus: true,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: elevatedButtonColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 0, left: 20),
        hintText: 'Login code ...',
        filled: true,
        fillColor: Colors.white,
        enabledBorder: outlinedInputBorder(),
        focusedBorder: outlinedInputBorder(),
      ),
    );
  }
}

OutlineInputBorder outlinedInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: elevatedButtonColor),
    borderRadius: const BorderRadius.all(Radius.circular(20)),
  );
}

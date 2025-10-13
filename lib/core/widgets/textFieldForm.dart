import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        focusColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

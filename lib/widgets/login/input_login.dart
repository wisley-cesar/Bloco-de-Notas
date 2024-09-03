import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final String title;
  final String messageInputNull;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const InputLogin({
    Key? key,
    required this.title,
    required this.obscureText,
    required this.textInputType,
    required this.messageInputNull,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: Theme.of(context).colorScheme.onSurface, // Cor do cursor
      cursorWidth: 2.0, // Largura do cursor
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: messageInputNull,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}

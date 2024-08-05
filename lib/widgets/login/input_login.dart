import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputLogin extends StatelessWidget {
  final String title;
  final String messageIputNuul;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const InputLogin(
      {super.key,
      required this.title,
      required this.obscureText,
      required this.textInputType,
      required this.messageIputNuul,
      this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}


//  (inputLogin) {
//         if (inputLogin == null || inputLogin.isEmpty) {
//           return 'Por Favor inisira ';
//         } else if (!RegExp(
//                 r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//             .hasMatch(_emailController.text)) {
//           return 'Por favor, digite um e-mail correto';
//         }
//         return null;
//       },
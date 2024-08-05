import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 128,
      child: Image.network(
          'https://static.vecteezy.com/ti/vetor-gratis/p1/4853167-notes-notepad-notebook-memo-diary-paper-line-icon-vector-illustration-logo-template-apropriado-para-muitos-propositos-gratis-vetor.jpg'),
    );
  }
}

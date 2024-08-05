import 'package:flutter/material.dart';

class MyDegrade extends StatelessWidget {
  final Widget child;
  final List<Color> listColor;
  const MyDegrade({super.key, required this.child, required this.listColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: listColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

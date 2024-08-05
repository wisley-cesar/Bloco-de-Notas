import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Color colorImagem;
  final Function() onPressed;

  const ButtonLogin({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.colorImagem,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 28,
              width: 28,
              child: Image.network(
                image,
                color: colorImagem,
              ),
            )
          ],
        ),
      ),
    );
  }
}

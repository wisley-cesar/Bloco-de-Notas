import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bloco de Notas',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          CircleAvatar(
            radius: 25,
            child: Image.network(
              'https://github.com/RicardoMouraa/link-bio-bento-box/blob/main/img/smile-icon.png?raw=true',
            ),
          )
        ],
      ),
    );
  }
}

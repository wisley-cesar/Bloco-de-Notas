import 'package:flutter/material.dart';

class InputPost extends StatelessWidget {
  final String description;
  final TextEditingController controller;

  const InputPost({
    super.key,
    required this.description,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: description,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
          cursorColor: Theme.of(context).colorScheme.onSurface, // Cor do cursor
          cursorWidth: 2.0, // Largura do cursor
          cursorHeight:
              20.0, // Altura do cursor (pode ser ajustado conforme necessário)
        ),
      ),
    );
  }
}

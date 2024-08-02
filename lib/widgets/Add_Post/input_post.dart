import 'package:flutter/material.dart';

class InputPost extends StatelessWidget {
  final String descripiton;
  // final TextEditingController controller;

  const InputPost({
    super.key,
    required this.descripiton,
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
          decoration: InputDecoration(
            label: Text(descripiton),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),
    );
  }
}

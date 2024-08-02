import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  // final double aspectRatio;
  const MyCart({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    // required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

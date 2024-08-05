import 'package:flutter/material.dart';

class UtilAppBar extends StatelessWidget {
  final String title;
  final String image;
  final Function()? onPressed;
  const UtilAppBar({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: CircleAvatar(
              radius: 25,
              child: Image.network(image),
            ),
          )
        ],
      ),
    );
  }
}

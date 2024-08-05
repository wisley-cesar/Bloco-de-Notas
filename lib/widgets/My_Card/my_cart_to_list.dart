import 'package:flutter/material.dart';

class MyCartToList extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final Function()? onTap;
  final bool? isEditing;
  final TextEditingController? controller;
  final Function(String)? onDescriptionChanged;

  const MyCartToList({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.onTap,
    this.isEditing = false,
    this.controller,
    this.onDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 10),
              isEditing!
                  ? Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: onDescriptionChanged,
                        decoration: InputDecoration(
                          hintText: 'Digite uma nova descrição...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

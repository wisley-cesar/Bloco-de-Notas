import 'package:flutter/material.dart';

class MyCartToList extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool? isEditing;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final Function(String)? onTitleChanged;
  final Function(String)? onDescriptionChanged;

  const MyCartToList({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.onTap,
    required this.onLongPress,
    this.isEditing = false,
    this.titleController,
    this.descriptionController,
    this.onTitleChanged,
    this.onDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              isEditing!
                  ? TextField(
                      controller: titleController,
                      onChanged: onTitleChanged,
                      decoration: InputDecoration(
                        hintText: 'Digite um novo título...',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                    )
                  : Text(
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
                        controller: descriptionController,
                        onChanged: onDescriptionChanged,
                        decoration: InputDecoration(
                          hintText: 'Digite uma nova descrição...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.text,
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

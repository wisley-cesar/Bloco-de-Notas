import 'package:bloco_de_notas/widgets/Add_Post/input_post.dart';
import 'package:bloco_de_notas/widgets/Add_Post/post_button.dart';
import 'package:flutter/material.dart';

class AddNewPost extends StatelessWidget {
  const AddNewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: const Column(
                        children: [
                          SizedBox(height: 10),
                          InputPost(descripiton: 'Título'),
                          SizedBox(height: 10),
                          InputPost(descripiton: 'Descrição'),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              PostButton(title: 'Cancelar'),
                              PostButton(title: 'Enviar'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}

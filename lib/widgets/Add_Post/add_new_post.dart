import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/Add_Post/input_post.dart';
import 'package:bloco_de_notas/widgets/Add_Post/post_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewPost extends StatelessWidget {
  final UserModel user;
  const AddNewPost({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final _api = ApiService();
    final _title = TextEditingController();
    final _description = TextEditingController();
    final blocoDeNotasProvider =
        Provider.of<BlocoDeNotasProvider>(context, listen: false);

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
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          InputPost(
                            description: 'Título',
                            controller: _title,
                          ),
                          SizedBox(height: 10),
                          InputPost(
                            description: 'Descrição',
                            controller: _description,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              PostButton(
                                title: 'Cancelar',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              PostButton(
                                title: 'Enviar',
                                onPressed: () async {
                                  await _api.createPostIt(
                                    _title.text,
                                    _description.text,
                                    user.token!,
                                    user.id,
                                  );

                                  // Atualiza a lista de blocos de notas
                                  await blocoDeNotasProvider
                                      .updateBlocoDeNotas(user);

                                  // Fecha o modal após enviar
                                  Navigator.pop(context);
                                },
                              ),
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

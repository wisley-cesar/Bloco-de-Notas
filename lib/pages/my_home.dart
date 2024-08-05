import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/Add_Post/add_new_post.dart';
import 'package:bloco_de_notas/widgets/Barra_De_Pesquisa/barra_pesquisa.dart';
import 'package:bloco_de_notas/widgets/My_Card/list_to_cards.dart';
import 'package:bloco_de_notas/widgets/App_bar/my_app_bar.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List?;

    if (args != null && args.length == 2 && args[0] is UserModel) {
      final UserModel user = args[0] as UserModel;
      final List<BlocoDeNotas> dados = args[1] as List<BlocoDeNotas>;

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyAppBar(userModel: user),
              const SizedBox(height: 10),
              const BarraPesquisa(),
              Expanded(
                child: ListToCards(dados: dados),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddNewPost(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Erro')),
        body: Center(
          child: Text(
            'Erro: Usuário não autenticado ou argumento inválido.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}

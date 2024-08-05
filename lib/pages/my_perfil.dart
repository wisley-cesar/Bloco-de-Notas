import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:bloco_de_notas/widgets/My_Card/list_to_cards.dart';
import 'package:bloco_de_notas/widgets/Perfil/perfil_widget.dart';

class MyPerfil extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BlocoDeNotas> dados =
        ModalRoute.of(context)!.settings.arguments as List<BlocoDeNotas>;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          right: 20,
          // left: 20,
        ),
        child: Column(
          children: [
            PerfilWidget(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Meu Posts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListToCards(
                dados: dados,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

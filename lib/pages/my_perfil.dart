import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:bloco_de_notas/widgets/My_Card/list_to_cards.dart';
import 'package:bloco_de_notas/widgets/Perfil/perfil_widget.dart';
import 'package:provider/provider.dart';

class MyPerfil extends StatelessWidget {
  final ApiService apiService = ApiService();

  MyPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtendo o usuário e os blocos de notas a partir dos Providers
    final user = Provider.of<UserProvider>(context).user;
    final dados = Provider.of<BlocoDeNotasProvider>(context).blocosDeNotas;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80,
          right: 20,
        ),
        child: Column(
          children: [
            PerfilWidget(),
            SizedBox(height: 20),
            Text(
              'Posts de: ${user?.username}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: dados.isNotEmpty
                  ? ListToCards(dados: dados)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Nenhum postIt encontrado.\n Comece criando um novo!',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

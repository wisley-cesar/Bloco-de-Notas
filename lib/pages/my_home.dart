import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';
import 'package:bloco_de_notas/widgets/Add_Post/add_new_post.dart';
import 'package:bloco_de_notas/widgets/App_bar/my_app_bar.dart';
import 'package:bloco_de_notas/widgets/Barra_De_Pesquisa/barra_pesquisa.dart';
import 'package:bloco_de_notas/widgets/My_Card/list_to_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final blocosDeNotasProvider = Provider.of<BlocoDeNotasProvider>(context);

    // Verifica se o user ou dados são nulos
    if (userProvider.user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Erro')),
        body: Center(
          child: Text(
            'Erro: Usuário não autenticado.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final dados = blocosDeNotasProvider.blocosDeNotas;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyAppBar(),
            const SizedBox(height: 10),
            const BarraPesquisa(),
            Expanded(
              child: dados.isNotEmpty
                  ? ListToCards(dados: dados)
                  : Center(
                      child: Text(
                        'Nenhum postIt encontrado.\n Comece criando um novo!',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AddNewPost(user: userProvider.user!),
    );
  }
}

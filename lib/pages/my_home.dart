import 'package:bloco_de_notas/widgets/Add_Post/add_new_post.dart';
import 'package:bloco_de_notas/widgets/Barra_De_Pesquisa/barra_pesquisa.dart';
import 'package:bloco_de_notas/widgets/My_Card/list_to_cards.dart';
import 'package:bloco_de_notas/widgets/App_bar/my_app_bar.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyAppBar(),
            const SizedBox(height: 10),
            const BarraPesquisa(),
            Expanded(child: ListToCards()),
          ],
        ),
      ),
      bottomNavigationBar: AddNewPost(),
    );
  }
}

import 'package:bloco_de_notas/data/dados.dart';
import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListToCards extends StatelessWidget {
  final List<BlocoDeNotas> dados = DUMMIDADOS;
  ListToCards({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: dados.length,
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final item = dados[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyCart(
            id: item.id,
            title: item.title,
            description: item.description,
          ),
        );
      },
    );
  }
}

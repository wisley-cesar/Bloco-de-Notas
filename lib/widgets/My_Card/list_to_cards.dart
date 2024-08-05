import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart_to_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListToCards extends StatelessWidget {
  final List<BlocoDeNotas> dados;
  ListToCards({
    super.key,
    required this.dados,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: dados.length,
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final item = dados[index];
        return Padding(
          padding: const EdgeInsets.all(0),
          child: MyCartToList(
            onTap: () {
              Navigator.of(context).pushNamed(
                MyRoutes.MYCART,
                arguments: item,
              );
            },
            id: item.id,
            title: item.title,
            description: item.description,
          ),
        );
      },
    );
  }
}

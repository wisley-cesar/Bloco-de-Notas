

import 'package:flutter/material.dart';
import 'package:bloco_de_notas/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart_to_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';
import 'package:bloco_de_notas/service/api_service.dart';

class ListToCards extends StatelessWidget {
  final List<BlocoDeNotas> dados;

  ListToCards({
    super.key,
    required this.dados,
  });

  Future<void> _confirmDelete(BuildContext context, BlocoDeNotas item) async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Tem certeza de que deseja excluir este item?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(
                'Excluir',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await _deleteItem(context, item);
    }
  }

  Future<void> _deleteItem(BuildContext context, BlocoDeNotas item) async {
    final apiService = ApiService();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final blocoDeNotasProvider =
        Provider.of<BlocoDeNotasProvider>(context, listen: false);

    try {
      await apiService.deletePostIt(
        userProvider.user!.token!,
        item.title,
        item.description,
        userProvider.user!.id,
        item.id,
      );

      blocoDeNotasProvider
          .removeBlocoDeNotas(blocoDeNotasProvider.blocosDeNotas.indexOf(item));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('PostIt excluído com sucesso!'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao excluir o PostIt: $e'),
      ));
      print(e); // Coloque aqui para capturar e mostrar o erro
    }
  }

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
            onLongPress: () {
              _confirmDelete(context, item);
            },
            onTap: () {
              Navigator.of(context).pushNamed(
                MyRoutes.MYCART,
                arguments: item.id,
              );
            },
            id: item.id.toString(),
            title: item.title,
            description: item.description,
          ),
        );
      },
    );
  }
}

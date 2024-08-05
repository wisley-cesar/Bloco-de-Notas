import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:flutter/material.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          child: Icon(
            size: 25,
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(MyRoutes.MYHOME);
          },
        ),
        Text(
          'Perfil',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        CircleAvatar(
          radius: 25,
          child: Image.network(
              'https://github.com/RicardoMouraa/link-bio-bento-box/blob/main/img/smile-icon.png?raw=true'),
        ),
      ],
    );
  }
}

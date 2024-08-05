import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final UserModel userModel;
  const MyAppBar({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Bloco de Notas ',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MyRoutes.MYPERFIL, arguments: userModel);
            },
            child: CircleAvatar(
              radius: 25,
              child: Image.network(
                'https://github.com/RicardoMouraa/link-bio-bento-box/blob/main/img/smile-icon.png?raw=true',
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/login/button_login.dart';
import 'package:bloco_de_notas/widgets/login/input_login.dart';
import 'package:bloco_de_notas/widgets/login/my_degrade.dart';
import 'package:bloco_de_notas/widgets/login/my_logo.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _passwordControllerConfirme = TextEditingController();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          children: [
            MyLogo(),
            SizedBox(height: 40),
            InputLogin(
              title: 'E-mail',
              controller: _emailController,
              messageInputNull: 'Por favor Digite um user valido',
              obscureText: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            InputLogin(
              controller: _passwordController,
              title: 'Senha',
              messageInputNull: 'Por Favor digite sua senha',
              obscureText: true,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            InputLogin(
              title: 'Confirmar Senha ',
              controller: _passwordControllerConfirme,
              messageInputNull: 'Por Favor digite sua senha',
              obscureText: true,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 60),
            SizedBox(height: 20),
            MyDegrade(
              listColor: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.onSurface,
              ],
              child: ButtonLogin(
                title: 'Cadastrar',
                image:
                    'https://img.icons8.com/?size=100&id=3&format=png&color=000000',
                colorImagem: Theme.of(context).colorScheme.surface,
                color: Theme.of(context).colorScheme.surface,
                onPressed: () async {
                  await apiService.register(
                      _emailController.text, _passwordController.text);
                  Navigator.of(context).pushNamed(MyRoutes.LOGIN);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/login/button_login.dart';
import 'package:bloco_de_notas/widgets/login/input_login.dart';
import 'package:bloco_de_notas/widgets/login/my_degrade.dart';
import 'package:bloco_de_notas/widgets/login/my_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    ApiService apiService = ApiService();

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
            SizedBox(height: 20),
            InputLogin(
              title: 'E-mail',
              controller: _emailController,
              messageIputNuul: 'Por favor, Digite um e-mail valido',
              validator: (inputLogin) {
                if (inputLogin == null || inputLogin.isEmpty) {
                  return 'Por Favor inisira ';
                } else if (!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(_emailController.text)) {
                  return 'Por favor, digite um e-mail correto';
                }
                return null;
              },
              obscureText: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            InputLogin(
              title: 'Senha',
              controller: _passwordController,
              messageIputNuul: 'Por Favor, digite sua senha',
              obscureText: true,
              textInputType: TextInputType.text,
            ),
            SizedBox(height: 60),
            MyDegrade(
              listColor: [
                Theme.of(context).colorScheme.onSurface,
                Theme.of(context).colorScheme.secondary,
              ],
              child: ButtonLogin(
                title: 'Login',
                image:
                    'https://img.icons8.com/?size=100&id=4DqMzI0F7ksp&format=png&color=000000',
                colorImagem: Theme.of(context).colorScheme.surface,
                color: Theme.of(context).colorScheme.surface,
                onPressed: () async {
                  UserModel user = await apiService.login(
                      _emailController.text, _passwordController.text);

                  Navigator.of(context).pushNamed(MyRoutes.MYHOME, arguments: [
                    user,
                    await apiService.findByAuthorld(user.id),
                  ]);
                },
              ),
            ),
            SizedBox(height: 20),
            MyDegrade(
              listColor: [
                Theme.of(context).primaryColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              child: ButtonLogin(
                title: 'Cadastrar',
                image:
                    'https://img.icons8.com/?size=100&id=3&format=png&color=000000',
                colorImagem: Theme.of(context).colorScheme.onSurface,
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.CADASTRO);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

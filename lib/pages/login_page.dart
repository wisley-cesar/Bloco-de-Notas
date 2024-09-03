import 'package:flutter/material.dart';

import 'package:bloco_de_notas/model/user_model.dart';
import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/service/api_service.dart';
import 'package:bloco_de_notas/widgets/login/button_login.dart';
import 'package:bloco_de_notas/widgets/login/input_login.dart';
import 'package:bloco_de_notas/widgets/login/my_degrade.dart';
import 'package:bloco_de_notas/widgets/login/my_logo.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<
      FormState>(); // Chave global para acessar o estado do formulário
  bool _isLoading = false;
  ApiService apiService = ApiService();
  String? _emailError; // Variável para armazenar o erro de e-mail
  String? _passwordError; // Variável para armazenar o erro de senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Theme.of(context).colorScheme.primary,
        child: Form(
          key: _formKey, // Associando a chave global ao formulário
          child: ListView(
            children: [
              MyLogo(),
              SizedBox(height: 20),
              InputLogin(
                title: 'E-mail',
                controller: _emailController,
                messageInputNull: 'Por favor, Digite um user',
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu user';
                  }
                  return _emailError; // Retorna o erro de e-mail armazenado
                },
              ),
              SizedBox(height: 20),
              InputLogin(
                title: 'Senha',
                controller: _passwordController,
                messageInputNull: 'Por Favor, digite sua senha',
                obscureText: true,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua senha';
                  }
                  return _passwordError; // Retorna o erro de senha armazenado
                },
              ),
              SizedBox(height: 60),
              MyDegrade(
                listColor: [
                  Theme.of(context).colorScheme.onSurface,
                  Theme.of(context).colorScheme.secondary,
                ],
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ButtonLogin(
                        title: 'Login',
                        image:
                            'https://img.icons8.com/?size=100&id=4DqMzI0F7ksp&format=png&color=000000',
                        colorImagem: Theme.of(context).colorScheme.surface,
                        color: Theme.of(context).colorScheme.surface,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            UserModel user = await apiService.login(
                              _emailController.text,
                              _passwordController.text,
                            );

                            if (user != null) {
                              final dados = await apiService.findByAuthorld(
                                user.id,
                                user.token as String,
                              );

                              Provider.of<UserProvider>(context, listen: false)
                                  .setUser(user);
                              Provider.of<BlocoDeNotasProvider>(context,
                                      listen: false)
                                  .setDados(dados);

                              Navigator.of(context).pushNamed(MyRoutes.MYHOME);

                              setState(() {
                                _isLoading = false;
                                _emailError = null; // Limpa o erro de e-mail
                                _passwordError = null; // Limpa o erro de senha
                              });
                            } else {
                              setState(() {
                                _isLoading = false;
                                _emailError =
                                    'E-mail ou senha incorretos'; // Define o erro de e-mail
                                _passwordError =
                                    'E-mail ou senha incorretos'; // Define o erro de senha
                              });
                            }
                          }
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
      ),
    );
  }
}

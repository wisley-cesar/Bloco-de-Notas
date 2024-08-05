import 'package:bloco_de_notas/color/color_palette.dart';
import 'package:bloco_de_notas/pages/cadastro_page.dart';
import 'package:bloco_de_notas/pages/login_page.dart';
import 'package:bloco_de_notas/pages/my_home.dart';
import 'package:bloco_de_notas/pages/my_perfil.dart';
import 'package:bloco_de_notas/routes/my_routes.dart';
import 'package:bloco_de_notas/widgets/My_Card/my_cart.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloco de Notas',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.LOGIN,
      routes: {
        MyRoutes.MYHOME: (context) => MyHome(),
        MyRoutes.LOGIN: (context) => LoginPage(),
        MyRoutes.CADASTRO: (context) => CadastroPage(),
        MyRoutes.MYPERFIL: (context) => MyPerfil(),
        MyRoutes.MYCART: (context) => MyCart(),
      },
    );
  }
}

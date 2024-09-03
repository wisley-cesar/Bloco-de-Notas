import 'package:bloco_de_notas/app/my_app.dart';

import 'package:bloco_de_notas/providers/bloco_de_notas_provaider.dart';
import 'package:bloco_de_notas/providers/use_provaider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BlocoDeNotasProvider()),
      ],
      child: MyApp(),
    ),
  );
}

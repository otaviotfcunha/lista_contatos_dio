import 'package:flutter/material.dart';
import 'package:lista_contatos_dio/pages/carregamento_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarregamentoPage(),
    );
  }
}
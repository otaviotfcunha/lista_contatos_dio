import 'package:flutter/material.dart';
import 'package:lista_contatos_dio/pages/cadastro_page.dart';
import 'package:lista_contatos_dio/shared/widgets/menu_lateral.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroPage()));
      }, child: const Icon(Icons.add)),
    ));
  }
}
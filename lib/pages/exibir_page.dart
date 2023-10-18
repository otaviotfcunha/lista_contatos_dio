import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/repositories/contatos_repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ExibirPage extends StatefulWidget {
  static String? itemId;
  ExibirPage({super.key, required String idRecebido}){
    itemId = idRecebido;
  }

  @override
  State<ExibirPage> createState() => _ExibirPageState();
}

class _ExibirPageState extends State<ExibirPage> {
  ContatosRepository contatosRepository = ContatosRepository();
  var id = ExibirPage.itemId;
  var carregando = false;
  var _contato = ContatosModel([]);
  String path = "";
  late XFile photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarContato();
  }

  void carregarContato() async {
    setState(() {
      carregando = true;
    });
    _contato = await contatosRepository.exibirContato(id.toString());
    path = (await path_provider.getApplicationDocumentsDirectory()).path;
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Exibindo o Contato ID: $id"),),
      body: ListView.builder(
        itemCount: _contato.results.length,
        itemBuilder: (BuildContext bc, int index) {
          var contact = _contato.results[0];
          photo = XFile("$path/${contact.foto}");
          return carregando ? const Center(child: CircularProgressIndicator()) : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: contact.foto == "sem-foto.jpg" ? Image.asset("images/${contact.foto}") : Image.file(File(photo.path))
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Nome: ")
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(contact.nome)
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Telefone: ")
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(contact.telefone)
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Email: ")
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(contact.email)
                    ),
                  ],
                ),
        
                
        
              ],
            ),
          );
        }





      ),
    ));
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/pages/editar_page.dart';
import 'package:lista_contatos_dio/pages/exibir_page.dart';
import 'package:lista_contatos_dio/repositories/contatos_repository.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  ContatosRepository contatosRepository = ContatosRepository();
  var _contatos = ContatosModel([]);
  bool carregando = false;
  String path = "";
  late XFile photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarContatos();
  }

  void carregarContatos() async {
    setState(() {
      carregando = true;
    });
    _contatos = await contatosRepository.listarContatos();
    path = (await path_provider.getApplicationDocumentsDirectory()).path;
    setState(() {
      carregando = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Seus contatos"),),
      body: carregando ? const Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: _contatos.results.length,
          itemBuilder: (BuildContext bc, int index) {
            var contact = _contatos.results[index];
            photo = XFile("$path/${contact.foto}");
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExibirPage(idRecebido: contact.objectId)));
                  },
                  title: Text("NOME: ${contact.nome.toString()}", style: const TextStyle(fontWeight: FontWeight.bold),),
                  leading: contact.foto == "sem-foto.jpg" ? Image.asset('images/${contact.foto}') : Image.file(File(photo.path)),
                  subtitle: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contact.telefone.toString()),
                            Text(contact.email.toString()),
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditarPage(idRecebido: contact.objectId)));
                        },
                        child: const Icon(Icons.edit),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () async {
                          await contatosRepository.remover(contact.objectId);
                          carregarContatos();
                        },
                        child: const Icon(Icons.delete),
                      ),
                    ),
                    ],
                  ),
                ),
              ),
            );
          }
       ),
      ),
    );
  }
}
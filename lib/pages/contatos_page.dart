import 'package:flutter/material.dart';
import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/repositories/contatos_repository.dart';
import 'package:lista_contatos_dio/shared/app_images.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  ContatosRepository enderecosRepository = ContatosRepository();
  var _contatos = ContatosModel([]);
  bool carregando = false;

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
    _contatos = await enderecosRepository.listarContatos();
    setState(() {
      carregando = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Seus contatos"),),
      body: ListView.builder(
          itemCount: _contatos.results.length,
          itemBuilder: (BuildContext bc, int index) {
            var contact = _contatos.results[index];
            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ListTile(
                  title: Text("NOME: ${contact.nome.toString()}", style: const TextStyle(fontWeight: FontWeight.bold),),
                  leading: Image.asset('images/${contact.foto}'),
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
                        },
                        child: Icon(Icons.edit),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () async {
                          await enderecosRepository.remover(contact.objectId);
                          carregarContatos();
                        },
                        child: Icon(Icons.delete),
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
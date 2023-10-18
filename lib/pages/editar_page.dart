import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/models/utils.dart';
import 'package:lista_contatos_dio/pages/contatos_page.dart';
import 'package:lista_contatos_dio/repositories/contatos_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class EditarPage extends StatefulWidget {
  static String? itemId;
  EditarPage({super.key, required String idRecebido}){
    itemId = idRecebido;
  }

  @override
  State<EditarPage> createState() => _EditarPageState();

}

class _EditarPageState extends State<EditarPage> {
  ContatosRepository contatosRepository = ContatosRepository();
  var _contato = ContatosModel([]);
  var id = EditarPage.itemId;
  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var carregando = false;
  bool subiuFoto = false;
  String path = "";
  late XFile? photo;
  String fotoNome = "sem-foto.jpg";
  
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
      appBar: AppBar(
        title: Text("Editar o Contato ID: $id"), 
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContatosPage()));
          },
        ), 
      ),
      body: ListView.builder(

        itemCount: _contato.results.length,
        itemBuilder: (BuildContext bc, int index) {
          var contact = _contato.results[0];
          if(!subiuFoto){
            photo = XFile("$path/${contact.foto}");
            fotoNome = contact.foto;
            nomeController.text = contact.nome;
            telefoneController.text = contact.telefone;
            emailController.text = contact.email;
          }

          return carregando ? const Center(child: CircularProgressIndicator()) : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: contact.foto == "sem-foto.jpg" && !subiuFoto ? Image.asset("images/${contact.foto}") : Image.file(File(photo!.path))
                    ),
                  ],
                ),
                TextButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (_){
                  return Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.photo_camera),
                        title: const Text("Acessar a câmera"),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          photo = await picker.pickImage(source: ImageSource.camera);
                          if(photo != null){
                            //fotoNome = basename(photo!.path);
                            //await photo!.saveTo("$path/$fotoNome");
                            photo = await Utils.cropImage(photo!);
                            fotoNome = basename(photo!.path);
                            await photo!.saveTo("$path/$fotoNome");
                            subiuFoto = true;                         
                            setState(() {});
                          }

                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text("Acessar a galeria"),
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          photo = await picker.pickImage(source: ImageSource.gallery);
                          if(photo != null){
                            //fotoNome = basename(photo!.path);
                            //await photo!.saveTo("$path/$fotoNome");   
                            //cropImage(photo!);
                            photo = await Utils.cropImage(photo!);
                            fotoNome = basename(photo!.path);
                            await photo!.saveTo("$path/$fotoNome");
                            subiuFoto = true;                         
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  );
                });

                }, child: const Text("Adicionar uma foto")),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text("Nome: ")
                    ),
                    Expanded(
                      flex: 5,
                      child: TextField(
                      controller: nomeController,  
                    )
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
                      child: TextField(
                      controller: telefoneController,  
                    )
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
                      child: TextField(
                      controller: emailController,  
                    )
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () async {
                          var alterarDados = ContatoModel.adicionaEAtualiza(contact.objectId, nomeController.text, telefoneController.text, emailController.text, fotoNome, false);
                          await contatosRepository.atualizar(alterarDados);
                          carregarContato();
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("O contato foi editado com sucesso!")
                            )
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContatosPage())
                          );
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue)),
                        child: const Text(
                          "Salvar as alterações",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
        
                
        
              ],
            ),
          );
        }
      ),
    ));
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos_dio/models/contatos_model.dart';
import 'package:lista_contatos_dio/models/utils.dart';
import 'package:lista_contatos_dio/repositories/contatos_repository.dart';
import 'package:lista_contatos_dio/shared/app_images.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var nomeController = TextEditingController(text: "");
  var telefoneController = TextEditingController(text: "");
  var emailController = TextEditingController(text: "");
  var carregando = false;
  bool subiuFoto = false;
  late String path;
  late XFile? photo;
  String fotoNome = "sem-foto.jpg";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarPagina();
  }

  carregarPagina() async{
    setState(() {
      carregando = true;
    });
    nomeController.text = "";
    telefoneController.text = "";
    emailController.text = "";
    path = (await path_provider.getApplicationDocumentsDirectory()).path;

    setState(() {
      carregando = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: const Text("Cadastrar um Contato"),),
      body: carregando ? const Center(child: CircularProgressIndicator()) : ListView(
        children: [
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  subiuFoto ? Expanded(child: Image.file(File(photo!.path))) : Expanded(child: Image.asset(AppImages.sem_foto))
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
                        ContatosRepository contatosRepository = ContatosRepository();
                        var insereDados = ContatoModel.adicionar(nomeController.text, telefoneController.text, emailController.text, fotoNome, false);
                        await contatosRepository.adicionar(insereDados);
                        subiuFoto = false;
                        carregarPagina();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("O contato foi adicionado com sucesso!")
                          )
                        );
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blue)),
                      child: const Text(
                        "Salvar o contato",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ),
      
              
      
            ],
          ),
        ),
      ]),
    ));
  }
}
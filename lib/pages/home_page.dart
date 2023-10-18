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
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text("Lista de Contatos"),
      ),
      body: ListView(
        children: const [Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                child: Text("Bem vindo!", style: TextStyle(fontSize: 24, color: Colors.blue),),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text("Este é o aplicativo do desafio de cadastro de contatos para o bootcamp do Santander da Dio.", style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.justify,),
              ),
              Divider(height: 5,),
              SizedBox(height: 5,),
              Center(
                child: Text("Check-List:", style: TextStyle(fontSize: 20, color: Colors.blue),),
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Criar uma aplicação Flutter​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Criar um banco de dados / Back4App​​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Fazer um cadastro de pessoa com foto de perfil​​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Salvar apenas o path da imagem na base de dados​​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Listar as pessoas em uma lista com sua respectiva foto​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.check_circle)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Usar os outros componentes aprendidos​"),
                  ),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 5,),
              Center(
                child: Text("Componentes/Bibliotecas utilizados:", style: TextStyle(fontSize: 20, color: Colors.blue),),
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Back4App​"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("flutter_dotenv"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("animated_text_kit"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("dio"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("image_picker"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("path_provider"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("path"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("image_cropper"),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.settings)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("shared_preferences"),
                  ),
                ],
              ),
              Divider(height: 5,),
              SizedBox(height: 5,),
              Center(
                child: Text("Última atualização em:", style: TextStyle(fontSize: 20, color: Colors.blue),),
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.timelapse)
                  ),
                  Expanded(
                    flex: 4,
                    child: Text("Criado e Desenvolvido por Otávio T. F. da Cunha, última atualização em 18/10/2023"),
                  ),
                ],
              ),
              
              
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastroPage()));
      }, child: const Icon(Icons.add)),
    ));
  }
}
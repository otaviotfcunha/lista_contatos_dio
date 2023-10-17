import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos_dio/pages/contatos_page.dart';
import 'package:lista_contatos_dio/shared/app_images.dart';
import 'package:lista_contatos_dio/shared/widgets/itens_menu_lateral.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: Column(              
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(image: AssetImage(AppImages.sem_foto), fit: BoxFit.cover),
                ),
                accountName: const Text("@otaviotfcunha", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 20)), 
                accountEmail: const Text("otavio@isistecnologia.com.br", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 16))
              ),
              const ItensMenuLateral(textMenu: "Contatos salvos", paginaDireciona: ContatosPage(), iconeMenu: Icons.person),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ItensMenuLateral(
                textMenu: "Sair", 
                paginaDireciona: AlertDialog(
                  title: const Text("Sair do Aplicativo", style: TextStyle(fontWeight: FontWeight.bold),),
                  content: const Wrap(
                    children: [
                      Text("Tem certeza que deseja sair do aplicativo?"),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: const Text("Não")),
                    TextButton(onPressed: (){
                      exit(0);
                    }, child: const Text("Sim")),
                  ],
                ), 
                iconeMenu: Icons.exit_to_app
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
  }
}
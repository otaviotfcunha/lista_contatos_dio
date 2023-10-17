import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos_dio/pages/home_page.dart';

class CarregamentoPage extends StatefulWidget {
  const CarregamentoPage({super.key});

  @override
  State<CarregamentoPage> createState() => _CarregamentoPageState();
}

class _CarregamentoPageState extends State<CarregamentoPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  carregarHome() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue,
              Colors.lightBlue,
            ],
                stops: [
              0.2,
              0.3,
            ])),
        child: Center(
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                repeatForever: false,
                onFinished: () {
                  carregarHome();
                },
                animatedTexts: [
                  FadeAnimatedText('Seja bem vindo!'),
                  FadeAnimatedText('Sua lista de contatos está iniciando...'),                  
                ],
                onTap: () {
                  carregarHome();
                },
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
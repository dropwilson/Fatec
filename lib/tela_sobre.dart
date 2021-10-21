import 'package:flutter/material.dart';
import 'package:projeto_01/tela_informacao.dart';

//
// TELA Sobre
//
class TelaSobre extends StatefulWidget {
  const TelaSobre({Key? key}) : super(key: key);

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  String integrantes = "Claudivan Pinto Santos\nWilson Colares dos Santos ";
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Aplicativo de Gerência e Controle de Ponto",
              style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    "assets/imagens/Desenvolvedor2.jpg",
                    height: 450,
                    alignment: Alignment.topCenter,
                  ),
                  const Text(
                    "Integrantes",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  Text(
                    integrantes,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  botaoEntrar(context),
                ],
              ),
            )),
          ],
        ));
  }
}

Widget botaoEntrar(context) {
  return Container(
    padding: const EdgeInsets.only(top: 30),
    child: ElevatedButton(
        child: const Text(
          ">>>>>>>>>>>   SAIBA MAIS   >>>>>>>>>>>",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const TelaInformacoes()));
        }),
  );
}

import 'package:flutter/material.dart';

class TelaInformacoes extends StatefulWidget {
  const TelaInformacoes({Key? key}) : super(key: key);

  @override
  _TelaInformacoes createState() => _TelaInformacoes();
}

class _TelaInformacoes extends State<TelaInformacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Voltar", style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Principais benefícios",
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  Image.network(
                    "assets/imagens/logo.png",
                    height: 150,
                    alignment: Alignment.topCenter,
                  ),
                  Image.network(
                    "assets/imagens/saiba-mais2.jpg",
                    height: 450,
                    alignment: Alignment.topCenter,
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class Registrador extends StatefulWidget {
  const Registrador({Key? key}) : super(key: key);

  @override
  _AutenticadorState createState() => _AutenticadorState();
}

class _AutenticadorState extends State<Registrador> {
  var formKey = GlobalKey<FormState>();
  var txtlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Ponto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "assets/imagens/ponto-eletronico.jpg",
                height: 300,
                alignment: Alignment.topCenter,
              ),
              campoTexto('Digite entrada ou saida', txtlogin),
              botaoEntrar(),
              Image.network(
                "assets/imagens/logo.png",
                height: 300,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget campoTexto(rotulo, controle) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          keyboardType: TextInputType.number,
          //Habilitar campo para senha
          //obscureText: true,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
          decoration: InputDecoration(
            labelText: rotulo,
            labelStyle: const TextStyle(color: Colors.black, fontSize: 18),
          ),
          controller: controle,
          //Validação do valor fornecedido
          validator: (value) {
            return (value!.isEmpty)
                ? "Para registrar entrada digite 1 ou entrada\nPara registrar a saida digite 2 ou saida"
                : null;
          },
        ));
  }

  Widget botaoEntrar() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: const Text(
          "Registrar",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: Theme.of(context).primaryColor,

        //
        // Evento ocorrera ao  clicar no botão
        //
        onPressed: () {
          //validator.
          if (formKey.currentState!.validate()) {
            setState(() {
              if (txtlogin.text == 'Entrada' ||
                  txtlogin.text == '1' ||
                  txtlogin.text == 'Saida' ||
                  txtlogin.text == '2') {
                if (txtlogin.text == 'Saida' || txtlogin.text == '2') {
                  txtlogin.text = '';
                  caixaDialogo('Saida registrada com sucesso!\n');
                } else {
                  txtlogin.text = '';
                  caixaDialogo('Entrada registrada com sucesso!\n');
                }
              } else {
                txtlogin.text = "";
                caixaDialogo(
                    '\fERRO!\f\nPor favor valores aceitos\nEntrada ou 1\nSaida ou 2 ');
              }
            });
          }
        },
      ),
    );
  }

  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Mensagem!', style: TextStyle(fontSize: 12)),
            content: Text(msg, style: const TextStyle(fontSize: 24)),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('fechar'))
            ],
          );
        });
  }
}

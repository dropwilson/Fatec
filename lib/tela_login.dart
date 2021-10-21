import 'package:flutter/material.dart';
import 'package:projeto_01/tela_principal.dart';

class Autenticador extends StatefulWidget {
  const Autenticador({Key? key}) : super(key: key);

  @override
  _AutenticadorState createState() => _AutenticadorState();
}

class _AutenticadorState extends State<Autenticador> {
  var formKey = GlobalKey<FormState>();
  var txtlogin = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Usuário'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  txtlogin.text = "";
                  txtSenha.text = "";
                });
              })
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.people_outline, size: 120, color: Colors.grey),
              campoTexto('LOGIN:', txtlogin),
              campoTexto('SENHA:', txtSenha),
              botaoEntrar(),
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
            return (value!.isEmpty) ? "Informe os dados de acesso" : null;
          },
        ));
  }

  Widget botaoEntrar() {
    var usercad = ['Wilson', 'Clauvivan', 'Admin'];
    var senhacad = '***';
    var aux = false;
    return Container(
      padding: const EdgeInsets.only(top: 30),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: const Text(
          "Entrar",
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
              for (var i = 0; i < 3; i++) {
                if (txtlogin.text == usercad[i]) {
                  aux = true;
                  i = 3;
                }
              }
              if (aux) {
                if (txtSenha.text == senhacad) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const TelaPrincipal()));
                  caixaDialogo('Seja bem Vindo\n' + txtlogin.text);
                } else {
                  txtlogin.text = "";
                  txtSenha.text = "";

                  caixaDialogo('ERRO! Tente novamente');
                }
              } else {
                txtlogin.text = "";
                txtSenha.text = "";
                caixaDialogo('ERRO! Tente novamente');
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

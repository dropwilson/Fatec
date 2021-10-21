import 'package:flutter/material.dart';

class FaleConosco extends StatefulWidget {
  const FaleConosco({Key? key}) : super(key: key);

  @override
  _FaleConoscoState createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtTelefone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtMsg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Fale Conosco",
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  _reset();
                })
          ],
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        campoTexto(
                          "Nome",
                          txtNome,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        campoTexto(
                          "Telefone",
                          txtTelefone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        campoTexto(
                          "Email",
                          txtEmail,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        campoMensagem(
                          "Mensagem",
                          txtMsg,
                        ),
                        botaoEnviar(context)
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  campoTexto(rotulo, controle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1),
      height: 40,
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
          labelText: rotulo,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        controller: controle,
      ),
    );
  }

  campoMensagem(rotulo, controle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1),
      height: 100,
      child: TextFormField(
        keyboardType: TextInputType.text,
        style: const TextStyle(color: Colors.black, fontSize: 30),
        decoration: InputDecoration(
          labelText: rotulo,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        controller: controle,
      ),
    );
  }

  botaoEnviar(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5),
        width: 30,
        height: 50,
        child: ElevatedButton(
          child: const Text(
            "Enviar",
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 30,
            ),
          ),
          //color: Colors.black,
          onPressed: () {
            _reset();
            caixaDialogo(
                "Entraremos em contato em breve!\nObrigado pela por usar nosso Aplicativo!");
          },
        ));
  }

  void _reset() {
    setState(() {
      txtNome.text = "";
      txtTelefone.text = "";
      txtEmail.text = "";
      txtMsg.text = "";
    });
  }

  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Obridado!', style: TextStyle(fontSize: 12)),
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

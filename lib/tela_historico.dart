import 'package:flutter/material.dart';

//
// TelaHistorico
//
class TelaHistorico extends StatefulWidget {
  const TelaHistorico({Key? key}) : super(key: key);

  @override
  _TelaHistoricoState createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  //lista dinâmica para armazenamento das tarefas
  var lista = [];

  @override
  void initState() {
    lista.add("Data 14/08/2021 \nEntrada: 15:14\nSaida: 23:38");
    lista.add("Data 15/08/2021 \nEntrada: 15:11 \nSaida: 23:35");
    lista.add("Data 16/08/2021 \nEntrada: 15:12 \nSaida: 23:30");
    lista.add("Data 17/08/2021 \nEntrada: Não Registrado \nSaida: 23:38");
    lista.add("Data 18/08/2021 \nEntrada: 15:14 \nSaida: 23:38");
    lista.add(
        "Data 19/08/2021 \nEntrada: Não Registrado \nSaida: Não Registrado");
    lista.add("Data 20/08/2021 \nEntrada: Folga 7º dia \nSaida: Folga 7º dia");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey.shade100,
              shadowColor: Colors.blue,
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.arrow_right),
                title: Text(
                  lista[index],
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    //remover um item da lista
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Você não tem privilegios para excluir registros'),
                        duration: Duration(seconds: 4),
                      ));
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

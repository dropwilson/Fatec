import 'package:flutter/material.dart';
import 'package:projeto_01/tela_registro.dart';
import 'package:projeto_01/tela_historico.dart';
import 'package:projeto_01/tela_fale_conosco.dart';
import 'package:projeto_01/tela_sobre.dart';

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Índice da página que será carregada inicialmente
  var telaAtual = 0;

  //Controlador utilizado para troca das telas (páginas)
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // BODY
      //
      body: PageView(
        controller: pageController,
        children: const [
          Registrador(), // currentIndex = 0
          TelaHistorico(), // currentIndex = 1
          FaleConosco(), // currentIndex = 2
          TelaSobre(), // currentIndex = 3
        ],
        onPageChanged: (index) {
          setState(() {
            telaAtual = index;
          });
        },
      ),

      //
      // BARRA DE NAVEGAÇÃO
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade800,

        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.40),

        selectedFontSize: 16,
        unselectedFontSize: 16,

        iconSize: 40,

        //Index do Botão Selecionado
        currentIndex: telaAtual,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Fale Conosco',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            label: 'Sobre',
          ),
        ],

        // Mudança de Tela (Página)
        onTap: (index) {
          setState(() {
            telaAtual = index;
          });

          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
          );
        },
      ),
    );
  }
}

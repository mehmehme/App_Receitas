import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Esta tela vai exibir os dados do usuário e seus comentários
    return Scaffold(
      appBar: AppBar(title: Text("Perfil")),
      body: Column(
        children: [
          Center(
              child: Text("Nome do Usuário", style: TextStyle(fontSize: 24))),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Comentário sobre a Receita X"),
                ),
                ListTile(
                  title: Text("Comentário sobre a Receita Y"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

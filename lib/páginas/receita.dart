import 'package:flutter/material.dart';

class DetalhesReceitaScreen extends StatelessWidget {
  final Map receita;

  DetalhesReceitaScreen({required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receita['title'])),
      body: Column(
        children: [
          Center(
            child: ClipOval(
              child: Image.network(receita['image'], height: 200, width: 200),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              receita['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Ingredientes: ${receita['ingredients']}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Modo de preparo: ${receita['instructions']}'),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para comentar ou curtir
            },
            child: Text("Deixe seu comentário"),
          ),
        ],
      ),
    );
  }
}

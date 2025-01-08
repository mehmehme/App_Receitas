import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Esta tela vai exibir os favoritos, similar ao que fizemos na tela de receitas
    return Scaffold(
      appBar: AppBar(title: Text("Favoritos")),
      body: Center(child: Text("Aqui estarão suas receitas favoritas")),
    );
  }
}

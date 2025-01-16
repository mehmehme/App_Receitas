import 'package:boas_receitas/p%C3%A1ginas/api_receitas.dart';
import 'package:flutter/material.dart';
import 'package:boas_receitas/páginas/favoritos.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int _selectedIndex = 0; // Controla a tela ativa
  List<String> ingredientes = []; // Ingredientes inseridos pelo usuário
  List<dynamic> receitas = []; // Receitas filtradas pela API
  TextEditingController ingredienteController = TextEditingController();
  List<dynamic> favoritos = []; // Favoritos do usuário

  // Função para adicionar uma receita aos favoritos
  void adicionarFavorito(dynamic receita) {
    setState(() {
      favoritos.add(receita);
    });
  }

  // Função para remover uma receita dos favoritos
  void removerFavorito(dynamic receita) {
    setState(() {
      favoritos.remove(receita);
    });
  }

  // Função para mostrar um aviso
  // ignore: unused_element
  void _mostrarAviso(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Aviso"),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Função para adicionar ingrediente à lista
  void adicionarIngrediente() {
    if (ingredienteController.text.isNotEmpty) {
      setState(() {
        ingredientes.add(ingredienteController.text);
        ingredienteController.clear();
      });
    }
  }

  // Função para remover ingrediente da lista
  void removerIngrediente(int index) {
    setState(() {
      ingredientes.removeAt(index);
    });
  }

  // Função chamada ao selecionar uma aba do BottomNavigationBar
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _buildPesquisarScreen,
          )
        ],
      ),
      body: _selectedIndex == 0
          ? _buildPesquisarScreen()
          : FavoritosScreen(), // Tela de Favoritos
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }

  // Tela de Pesquisa
  Widget _buildPesquisarScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: ingredienteController,
            decoration: InputDecoration(
              labelText: 'Ingrediente',
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => ingredienteController.clear(),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: adicionarIngrediente,
          child: Text("Adicionar Ingrediente"),
        ),
        Wrap(
          spacing: 8.0,
          children: ingredientes.map((ingrediente) {
            int index = ingredientes.indexOf(ingrediente);
            return Chip(
              label: Text(ingrediente),
              onDeleted: () => removerIngrediente(index),
            );
          }).toList(),
        ),
        // Lista de receitas com base nos ingredientes fornecidos
        Expanded(
          child: ReceitaList(
            ingredientes: ingredientes,
          ),
        ),
      ],
    );
  }
}

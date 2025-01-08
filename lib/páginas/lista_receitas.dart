import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int _selectedIndex = 0; // Controla a tela ativa
  List<String> ingredientes = [];
  List<dynamic> receitas = [];
  TextEditingController ingredienteController = TextEditingController();

  // Função para pesquisar receitas com base nos ingredientes
  Future<void> pesquisarReceitas() async {
    if (ingredientes.isEmpty)
      return; // Não faz a pesquisa se não houver ingredientes

    final ingredientesQuery = ingredientes.join(',');
    final response = await http.get(Uri.parse(
        'https://api-receitas-pi.vercel.app/recipes?ingredients=$ingredientesQuery'));

    if (response.statusCode == 200) {
      setState(() {
        receitas = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar receitas');
    }
  }

  // Função para adicionar um ingrediente à lista
  void adicionarIngrediente() {
    if (ingredienteController.text.isNotEmpty) {
      setState(() {
        ingredientes.add(ingredienteController.text);
        ingredienteController.clear(); // Limpa o campo de texto após adicionar
      });
      pesquisarReceitas(); // Atualiza a pesquisa com os ingredientes atualizados
    }
  }

  // Função para remover um ingrediente da lista
  void removerIngrediente(int index) {
    setState(() {
      ingredientes.removeAt(index);
    });
    pesquisarReceitas(); // Atualiza a pesquisa após remover um ingrediente
  }

  // Função chamada ao selecionar uma aba do BottomNavigationBar
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Tela de Pesquisar
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
        // Lista de ingredientes com ícones e botão de remoção
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Wrap(
            spacing: 8.0,
            children: ingredientes.map((ingrediente) {
              int index = ingredientes.indexOf(ingrediente);
              return Chip(
                label: Text(ingrediente),
                avatar: CircleAvatar(
                  child: Icon(Icons.remove),
                  backgroundColor: Colors.red,
                ),
                onDeleted: () => removerIngrediente(index),
              );
            }).toList(),
          ),
        ),
        ElevatedButton(
          onPressed: pesquisarReceitas,
          child: Text("Pesquisar Receitas"),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: receitas.length,
            itemBuilder: (context, index) {
              var receita = receitas[index];
              return Card(
                child: Stack(
                  children: [
                    Image.network(
                      receita['image'],
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            receita['title'],
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            receita['type'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {
                          // Lógica para adicionar aos favoritos
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Tela de Favoritos
  Widget _buildFavoritosScreen() {
    return Scaffold(
      appBar: AppBar(title: Text("Favoritos")),
      body: Center(child: Text("Aqui estarão suas receitas favoritas")),
    );
  }

  // Tela de Perfil
  Widget _buildPerfilScreen() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: pesquisarReceitas,
          )
        ],
      ),
      body: _selectedIndex == 0
          ? _buildPesquisarScreen()
          : _selectedIndex == 1
              ? _buildFavoritosScreen()
              : _buildPerfilScreen(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'provider_fav.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  Future<List<dynamic>> _fetchFavoritos(List<int> favoritosIds) async {
    List<dynamic> receitasFavoritas = [];

    for (int id in favoritosIds) {
      final response = await http
          .get(Uri.parse('https://api-receitas-pi.vercel.app/receitas/$id'));

      if (response.statusCode == 200) {
        final receita = json.decode(response.body);
        receitasFavoritas.add(receita);
      }
    }

    return receitasFavoritas;
  }

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Favoritos")),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchFavoritos(favoritosProvider.favoritos),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar favoritos"));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhuma receita favoritada"));
          } else {
            final receitasFavoritas = snapshot.data!;

            return ListView.builder(
              itemCount: receitasFavoritas.length,
              itemBuilder: (context, index) {
                final receita = receitasFavoritas[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(receita['link_imagem']),
                    ),
                    title: Text(receita['receita']),
                    subtitle: Text(receita['tipo']),
                    trailing: IconButton(
                      icon: Icon(
                        favoritosProvider.favoritos.contains(receita['id'])
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        favoritosProvider.toggleFavorito(receita['id']);
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

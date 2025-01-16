import 'dart:convert';
import 'package:boas_receitas/p%C3%A1ginas/receita.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReceitaList extends StatefulWidget {
  final List<String> ingredientes;

  const ReceitaList({
    super.key,
    required this.ingredientes,
  });
  @override
  _ReceitaListState createState() => _ReceitaListState();
}

class _ReceitaListState extends State<ReceitaList> {
  List<dynamic> receitas = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _buscarReceitas();
  }

  Future<void> _buscarReceitas() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api-receitas-pi.vercel.app/receitas/todas'),
      );

      if (response.statusCode == 200) {
        setState(() {
          receitas = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Erro ao buscar receitas');
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Erro ao carregar receitas'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _buscarReceitas,
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      );
    }

    // Filtrar receitas com base nos ingredientes
    final receitasFiltradas = receitas.where((receita) {
      final ingredientesReceita = receita['ingredientes'] ?? [];
      return widget.ingredientes.any(
        (ingrediente) => ingredientesReceita.contains(ingrediente),
      );
    }).toList();

    if (receitasFiltradas.isEmpty) {
      return Center(
        child: Card(
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Nenhuma receita encontrada para os ingredientes fornecidos. Tente adicionar outros ingredientes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: receitasFiltradas.length,
      itemBuilder: (context, index) {
        final receita = receitasFiltradas[index];
        return GestureDetector(
          onTap: () {
            // Navegar para a tela de detalhes
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReceitaDetalheScreen(receita: receita),
              ),
            );
          },
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipOval(
                      child: receita['link_imagem'] == ''
                          ? Icon(Icons.image_not_supported, size: 50)
                          : Image.network(
                              receita['link_imagem'] ?? '',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receita['receita'] ?? 'Sem título',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          receita['tipo'] ?? 'Sem tipo',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

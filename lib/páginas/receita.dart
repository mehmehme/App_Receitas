import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'package:boas_receitas/p%C3%A1ginas/provider_fav.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class ReceitaDetalheScreen extends StatelessWidget {
  final Map<String, dynamic> receita;

  ReceitaDetalheScreen({Key? key, required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receita Completa'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              context.watch<FavoritosProvider>().isFavorito(receita['id'])
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              context.read<FavoritosProvider>().toggleFavorito(receita['id']);
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colors.blue),
            onPressed: () => _salvarComoPDF(context, receita),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto da receita
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(receita['link_imagem'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              receita['receita'] ?? 'Sem título',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Ingredientes:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              receita['ingredientes']?.split(', ')?.join(', ') ??
                  'Sem ingredientes',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Modo de Preparo:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              receita['modo_preparo'] ?? 'Sem modo de preparo',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Salva a receita como PDF
Future<void> _salvarComoPDF(
    BuildContext context, Map<String, dynamic> receita) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Receita: ${receita['title']}',
              style:
                  pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text('Tipo: ${receita['type']}',
              style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 10),
          pw.Text('Descrição:', style: pw.TextStyle(fontSize: 18)),
          pw.Text(receita['description'] ?? 'Sem descrição',
              style: pw.TextStyle(fontSize: 14)),
        ],
      ),
    ),
  );

  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/${receita['title']}.pdf');
  await file.writeAsBytes(await pdf.save());

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Receita salva como PDF em ${file.path}')),
  );
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritosProvider with ChangeNotifier {
  List<int> _favoritos = [];

  List<int> get favoritos => _favoritos;

  FavoritosProvider() {
    _carregarFavoritos();
  }

  Future<void> _carregarFavoritos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoritosString = prefs.getStringList('favoritos');
    if (favoritosString != null) {
      _favoritos = favoritosString.map((e) => int.parse(e)).toList();
      notifyListeners();
    }
  }

  Future<void> _salvarFavoritos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'favoritos', _favoritos.map((e) => e.toString()).toList());
  }

  void toggleFavorito(int recipeId) {
    if (_favoritos.contains(recipeId)) {
      _favoritos.remove(recipeId);
    } else {
      _favoritos.add(recipeId);
    }
    _salvarFavoritos();
    notifyListeners();
  }

  bool isFavorito(int recipeId) {
    return _favoritos.contains(recipeId);
  }
}

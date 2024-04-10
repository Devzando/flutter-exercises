import 'package:flutter/material.dart';
import 'package:listviewproject/Dtos/Item.dart';

class FavoritesModel extends ChangeNotifier {
  List<Item> _favorites = [];

  List<Item> get favorites => _favorites;

  void addToFavorites(Item item) {
    _favorites.add(item);
    notifyListeners();
  }

  void removeFromFavorites(Item item) {
    _favorites.remove(item);
    notifyListeners();
  }
}

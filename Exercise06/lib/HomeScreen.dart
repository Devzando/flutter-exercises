import 'package:flutter/material.dart';
import 'package:listviewproject/AddItemPageWidget.dart';
import 'package:listviewproject/FavoritesModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Favoritos'),
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.favorites.length,
            itemBuilder: (context, index) {
              final item = model.favorites[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    model.removeFromFavorites(item);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

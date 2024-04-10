import 'package:flutter/material.dart';
import 'package:listviewproject/Dtos/Item.dart';
import 'package:listviewproject/FavoritesModel.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Nome do Item'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String itemName = controller.text.trim();
                if (itemName.isNotEmpty) {
                  Provider.of<FavoritesModel>(context, listen: false)
                      .addToFavorites(Item(itemName));
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}

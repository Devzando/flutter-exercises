import 'package:flutter/material.dart';
import 'package:listviewproject/Item.dart';

class ItemDetails extends StatelessWidget {
  final Item item;

  ItemDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(item.imageUrl),
            SizedBox(height: 20),
            Text(
              item.title,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

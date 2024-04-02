import 'package:flutter/material.dart';
import 'package:listviewproject/Item.dart';
import 'package:listviewproject/ItemDetails.dart';

class ItemList extends StatelessWidget {
  final List<Item> items;

  ItemList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].title),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(items[index].imageUrl),
            ),
            onTap: () {
              _showItemDetails(context, items[index]);
            },
          );
        },
      ),
    );
  }

  void _showItemDetails(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetails(item: item),
      ),
    );
  }
}

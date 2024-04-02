import 'package:flutter/material.dart';
import 'package:listviewproject/Item.dart';
import 'package:listviewproject/ItemList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Item> items = [
    Item(
        title: 'Item 1',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/7/7d/Microsoft_.NET_logo.svg'),
    Item(
        title: 'Item 2',
        imageUrl:
            'https://serverdo.in/wp-content/uploads/2019/05/node-js-736399_1280.jpg'),
    Item(
        title: 'Item 3',
        imageUrl:
            'https://miro.medium.com/v2/resize:fit:850/1*8KX5TdvTf6HlEjls69uPjw.png'),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Application name
        title: 'Flutter Hello World',
        // Application theme data, you can set the colors for the application as
        // you want
        theme: ThemeData(
          // useMaterial3: false,
          primarySwatch: Colors.blue,
        ),
        home: ItemList(items: items));
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PokemonWidget extends StatefulWidget {
  @override
  _PokemonWidgetState createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
  String pokemonName = 'ditto';
  String apiUrl = 'https://pokeapi.co/api/v2/pokemon/';

  List<String> abilities = [];
  int baseExperience = 0;
  int height = 0;
  int id = 0;
  int weight = 0;

  Future<void> fetchPokemonData() async {
    final response = await http.get(Uri.parse('$apiUrl$pokemonName'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        abilities.clear();
        for (var ability in data['abilities']) {
          abilities.add(ability['ability']['name']);
        }
        baseExperience = data['base_experience'];
        height = data['height'];
        id = data['id'];
        weight = data['weight'];
      });
    } else {
      throw Exception('Failed to load Pokemon data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name: $pokemonName',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Abilities:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: abilities.map((ability) {
                return Text(
                  ability,
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Base Experience: $baseExperience',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Height: $height',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'ID: $id',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Weight: $weight',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Pokemon App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: PokemonWidget(),
  ));
}

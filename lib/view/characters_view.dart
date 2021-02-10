import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/characters.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = 'https://rickandmortyapi.com/api/character/';
  Character character;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    character = Character.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: character.results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(character.results[index].image),
            title: Text(character.results[index].name),
            subtitle: Text(character.results[index].species),
          );
        },
      ),
    );
  }
}

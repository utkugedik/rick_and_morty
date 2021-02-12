import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/characters.dart';
import 'package:rick_and_morty/screens/characters/character_detail.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({Key key}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
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
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: character.results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(character.results[index].image),
            ),
            title: Text(character.results[index].name),
            subtitle: Text(character.results[index].species),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetail(
                    results: character.results[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

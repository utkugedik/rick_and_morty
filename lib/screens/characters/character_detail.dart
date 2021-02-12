import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/characters.dart';

class CharacterDetail extends StatelessWidget {
  final Results results;
  CharacterDetail({this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(results.name),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(results.image),
                ),
                Text(results.name)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

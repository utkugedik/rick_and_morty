import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/locations.dart';

class LocationDetail extends StatelessWidget {
  final Results results;
  LocationDetail({this.results});

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
              children: [Text(results.name)],
            ),
          ),
        ),
      ),
    );
  }
}

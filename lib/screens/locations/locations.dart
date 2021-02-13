import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/locations.dart';
import 'package:rick_and_morty/screens/locations/location_detail.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String url = 'https://rickandmortyapi.com/api/locations/';
  Location location;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);

    location = Location.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: location.results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(location.results[index].type),
            ),
            title: Text(location.results[index].name),
            subtitle: Text(location.results[index].type),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationDetail(
                    results: location.results[index],
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

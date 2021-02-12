import 'package:flutter/material.dart';
import 'package:rick_and_morty/screens/characters/characters.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rick and Morty'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Ink.image(
                      image: NetworkImage(
                          'https://pyxis.nymag.com/v1/imgs/cd8/804/e0f612fa12d17e68e3d68ccf55f93cac4f-06-rick-morty.jpg'),
                      height: 240,
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      'CHARACTERS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CharDetails extends StatelessWidget {
  final String _characterName;

  CharDetails(this._characterName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new CharacterDetails(_characterName)
          ],
        )
    );
  }
}

class CharacterDetails extends StatefulWidget {
  final String _characterName;
  CharacterDetails(this._characterName);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CharacterDetailsPageState(_characterName);
  }

}

class CharacterDetailsPageState extends State<CharacterDetails> {
  final String _characterName;

  CharacterDetailsPageState(this._characterName);

  Map data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://got-flutter.firebaseio.com/houses/characters/"+_characterName+".json"),
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });

    print('abcd - $data');
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;

    return new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
              child: new Image.network(
                'https://1v1d1e1lmiki1lgcvx32p49h8fe-wpengine.netdna-ssl.com/wp-content/uploads/2016/06/ned-stark-game-of-thrones-740x385.jpg',
                height: itemHeight - 86.0,
                width: itemWidth,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                _characterName,
                style: new TextStyle(
                    fontSize: 28.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                'Lord Eddard Stark, also known as Ned Stark, was the head of House Stark, the Lord of Winterfell, Lord Paramount and Warden of the North, and later Hand of the King to King Robert I Baratheon. He was the older brother of Benjen, Lyanna and the younger brother of Brandon Stark.',
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

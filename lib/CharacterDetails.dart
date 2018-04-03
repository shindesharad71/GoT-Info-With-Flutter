import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/LoadingPage.dart';
import 'package:flutter_image/network.dart';
import 'package:transparent_image/transparent_image.dart';

class CharDetails extends StatelessWidget {
  final String _characterName, _houseName;

  CharDetails(this._characterName, this._houseName);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
      children: <Widget>[new CharacterDetails(_characterName, _houseName)],
    ));
  }
}

class CharacterDetails extends StatefulWidget {
  final String _characterName, _houseName;

  CharacterDetails(this._characterName, this._houseName);

  @override
  State<StatefulWidget> createState() {
    return new CharacterDetailsPageState(_characterName, _houseName);
  }
}

class CharacterDetailsPageState extends State<CharacterDetails> {
  final String _characterName, _houseName;

  CharacterDetailsPageState(this._characterName, this._houseName);

  Map data;

//https://got-flutter.firebaseio.com/houses/characters/cerci.json
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull(
          "https://got-flutter.firebaseio.com/houses/$_houseName/characters/$_characterName.json"),
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });

//    print('abcd - $data');
    return "Success!";
  }

/*
* new Row(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                mainAxisSize: MainAxisSize.max,
                children: [
                  new CircularProgressIndicator(),
                  new Text("Loading..."),
                ],
          ),
* */
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return new LoadingPage();
    } else {
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
              /* child: new Image(
                image: new NetworkImageWithRetry(),
                width: itemWidth,
                fit: BoxFit.fill,
              ), */
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: data["image"],
                width: itemWidth,
                fit: BoxFit.fill,
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                _characterName + '\n(' + data["real_name"] + ')',
                style: new TextStyle(
                    fontSize: 28.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                data["description"],
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
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

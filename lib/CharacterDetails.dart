import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/LoadingPage.dart';
import 'package:flutter_image/network.dart';
import 'package:transparent_image/transparent_image.dart';

class CharDetails extends StatelessWidget {
  final String _characterName, _houseName;
  final Map data;

  CharDetails(this._characterName, this._houseName, this.data);

  @override
  Widget build(BuildContext context) {
//    print("aaaa :" + data[_characterName].toString());
    Map charDetailsData = data[_characterName];
    return new Scaffold(

      body: new CharacterDetailsPage(
          _characterName, _houseName, charDetailsData),
    );
  }
}

class CharacterDetailsPage extends StatelessWidget {
  final String _characterName, _houseName;
  final Map charDetailsData;

  CharacterDetailsPage(this._characterName, this._houseName,
      this.charDetailsData);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width;

    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 0.0),
            child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: charDetailsData["image"],
              width: itemWidth,
              fit: BoxFit.fill,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(
              _characterName + '\n(' + charDetailsData["real_name"] + ')',
              style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              child: new Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      charDetailsData["description"],
                      style: new TextStyle(
                        fontSize: 16.0, color: Colors.black,
                      ),
                    ),
                    new Text("fgyhuijojhucfcgbhjnkljhbgfvcvbhjkml;kjbhcgfbhjnk")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

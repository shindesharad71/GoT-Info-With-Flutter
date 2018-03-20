import 'package:flutter/material.dart';
import 'package:layouts/CharacterList.dart';

class SingleHousePage extends StatelessWidget {
  final String _houseName;

  SingleHousePage(this._houseName);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(_houseName),
          backgroundColor: Colors.black,
        ),
        body: new Container(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Text(_houseName,
                    style: new TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 36.0),
                    textAlign: TextAlign.center),
                new CharacterList()
              ],
            )));
  }
}

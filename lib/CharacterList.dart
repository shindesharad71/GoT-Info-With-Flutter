import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/CharacterDetails.dart';
import 'package:layouts/GradientAppBar.dart';
import 'package:layouts/LoadingPage.dart';
import 'package:flutter_image/network.dart';

class CharacterList extends StatelessWidget {
  final String _houseName;

  CharacterList(this._houseName);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(title: new Text(_houseName),),
        body: new Column(
          children: <Widget>[
            new GradientAppBar(_houseName),
            new CharacterListPage(_houseName)
          ],
        ));
  }
}

class CharacterListPage extends StatefulWidget {
  final String _houseName;

  CharacterListPage(this._houseName);

  @override
  State<StatefulWidget> createState() {
    return new CharacterListPageState(_houseName);
  }
}

class CharacterListPageState extends State<CharacterListPage> {
  final String _houseName;

  CharacterListPageState(this._houseName);

  Map data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://got-flutter.firebaseio.com/houses/" +
          _houseName +
          "/characters" +
          ".json"),
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    print(data);
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    // 24 is for notification bar on Android

    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width;

    Card myCard(String charName, String charImageUrl) {
      return new Card(
          elevation: 2.0,
          child: new InkWell(
            child: new Container(
              alignment: Alignment.topCenter,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: new Image(
                      alignment: Alignment.topCenter,
                      image: new NetworkImageWithRetry(charImageUrl),
                      fit: BoxFit.fitWidth,
                      height: 3*7.0*10,
                      width: itemWidth,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Center(
                      child: new Text(
                        charName,
                        style: new TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new CharDetails(charName, _houseName)),
              );
            },
          )
      );
    }
    if (data == null) {
      return new LoadingPage();
    } else {
      return new Flexible(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: new Container(
                      child: new GridView.builder(
                          itemCount: data == null ? 0 : data.length,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: (4 / 3),
                              crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index) {
                            var housename = data.keys.toList()[index]
                                .toString();
                            return myCard(
                                housename, data[housename]['image'].toString());
                          }
                      )
                  )
              ),
            ],
          )
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

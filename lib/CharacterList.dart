import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/CharacterDetails.dart';
import 'package:layouts/GradientAppBar.dart';
import 'package:layouts/LoadingPage.dart';
import 'package:flutter_image/network.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterList extends StatelessWidget {
  final String _houseName;
  final Map data;

  CharacterList(this._houseName, this.data);


  @override
  Widget build(BuildContext context) {
    Map charData = data;
    charData = data[_houseName]["characters"];
//    print(charData);
    return new Scaffold(
//        appBar: new AppBar(title: new Text(_houseName),),
        body: new Column(
          children: <Widget>[
            new GradientAppBar(_houseName),

            new CharacterListPage(_houseName, charData)
          ],
        ));
  }
}

class CharacterListPage extends StatefulWidget {
  final String _houseName;
  final Map charData;

  CharacterListPage(this._houseName, this.charData);

  @override
  State<StatefulWidget> createState() {
    return new CharacterListPageState(_houseName, charData);
  }
}

class CharacterListPageState extends State<CharacterListPage> {
  final String _houseName;
  final Map charData;

  CharacterListPageState(this._houseName, this.charData);

//  Map data;
//
//  Future<String> getData() async {
//    var response = await http.get(
//      Uri.encodeFull("https://got-flutter.firebaseio.com/houses/" +
//          _houseName +
//          "/characters" +
//          ".json"),
//    );
//
//    this.setState(() {
//      data = JSON.decode(response.body);
//    });
//    print(data);
//    return "Success!";
//  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    // 24 is for notification bar on Android

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
    final double itemWidth = size.width;

    Card myCard(String charName, String charImageUrl) {
      return new Card(
          elevation: 2.0,
          child: new InkWell(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 4,
                  child: new Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    /* child: new Image(
                      alignment: Alignment.topCenter,
                      image: new NetworkImageWithRetry(charImageUrl),
                      fit: BoxFit.fitWidth,
                      width: itemWidth,
//                      height: itemHeight - 50.0,
                    ), */
                    child: new FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: charImageUrl,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                      width: itemWidth,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Center(
                    child: new Text(
                      charName,
                      style: new TextStyle(fontSize: 24.0),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new CharDetails(charName, _houseName,charData)),
              );
            },
          ));
    }

    if (charData == null) {
      return new LoadingPage();
    } else {
      print(charData.keys.toList());
      return new Flexible(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: new Container(
                      child: new GridView.builder(
                          shrinkWrap: true,
                          itemCount: charData == null ? 0 : charData.length,
                          gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: itemWidth / itemHeight),
                          itemBuilder: (BuildContext context, int index) {
                            var charName = charData.keys.toList()[index]
                                .toString();
                            return myCard(
                                charName,
                                charData[charName]['image'].toString());
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
//    this.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

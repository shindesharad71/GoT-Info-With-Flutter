import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/CharacterDetails.dart';
import 'package:layouts/GradientAppBar.dart';
import 'package:layouts/LoadingPage.dart';
import 'package:layouts/wid/CustomContainer.dart';

class CharacterList extends StatelessWidget {
  final String _houseName;

  CharacterList(this._houseName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    // TODO: implement createState
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

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    Card myCard(String charName, String charImageUrl) {
      return new Card(
          elevation: 2.0,
          child: new InkWell(
            child: new CustomContainer(
                charImageUrl, charName, itemWidth, itemHeight).customFun(),
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
                              childAspectRatio: (itemWidth / itemHeight),
                              crossAxisCount: 2),
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

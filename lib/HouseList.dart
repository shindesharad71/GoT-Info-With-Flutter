import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/CharacterList.dart' show CharacterList;
import 'package:layouts/LoadingPage.dart';
import 'package:flutter_image/network.dart';

class HouseList extends StatefulWidget {
  @override
  HouseListState createState() => new HouseListState();
}

class HouseListState extends State<HouseList> {
  Map data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://got-flutter.firebaseio.com/houses.json"),
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // 24 is for notification bar on Android

    final double itemHeight = (size.height - 24 - kToolbarHeight) / 2.2;
    final double itemWidth = size.width / 2;
    Card myCard(String houseName, String houseImageUrl) {
      return new Card(
//        TODO- USE OF STACKED widget
          elevation: 2.0,
          child: new InkWell(
            child: new Container(
              alignment: Alignment.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: new Image(
                      image: new NetworkImageWithRetry(houseImageUrl),
                      height: itemWidth,
                      width: itemWidth,
                      fit: BoxFit.contain,
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Center(
                      child: new Text(
                        houseName,
                        style: new TextStyle(fontSize: 16.0),
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
                            new CharacterList(houseName,data)),
                  );
            },
          ));
    }

    if (data == null) {
      return new LoadingPage();
    } else {
      return new Flexible(
          child: new Container(
              child: new GridView.builder(
                  itemCount: data == null ? 0 : data.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight)),
                  itemBuilder: (BuildContext context, int index) {
                    var housename = data.keys.toList()[index].toString();
                    return myCard(
                        housename, data[housename]['image'].toString());
                  })));
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

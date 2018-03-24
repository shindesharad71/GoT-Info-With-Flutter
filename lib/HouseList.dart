import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:layouts/SingleHousePage.dart' show SingleHousePage;
import 'dart:io';

//https://got-flutter.firebaseio.com/houses.json
//Map data;
//String d;
class HouseList extends StatefulWidget {
  @override
  HouseListState createState() => new HouseListState();

/*
  var httpClient = new HttpClient();
  get() async{
    var httpClient = new HttpClient();
//  var uri = new Uri.http(
//      'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
    var uri = new Uri.https('got-flutter.firebaseio.com', '/houses.json');
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(UTF8.decoder).join();
    data = JSON.decode(responseBody);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    get();
    print(data);
//    List<String> housesNameList = data.keys.toList();
//    print(housesNameList);

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    Card myCard(String houseName, String houseImageUrl) {
      return new Card(
          elevation: 5.0,
          child: new InkWell(
            child: new Container(
              alignment: Alignment.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    houseImageUrl,
                    height: 180.0,
                    width: itemWidth,
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
                    new SingleHousePage(houseName)),
              );
            },
          )
      );
    }

    return new Flexible(
      child: new Container(
          child: new GridView.count(
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              primary: false,
              shrinkWrap: true,
              controller: new ScrollController(keepScrollOffset: false),
              scrollDirection: Axis.vertical,
              childAspectRatio: (itemWidth / 250.0),
              padding: const EdgeInsets.all(10.0),

              children: <Widget>[
                myCard(
                    "a",
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101103142'),
                myCard("House Arryn",
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/1/15/House-Arryn-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101094153'),
                myCard(
                  "House Tully",
                  'https://vignette.wikia.nocookie.net/gameofthrones/images/b/bd/House-Tully-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170523040648',
                ),
                myCard(
                  "House Baratheon",
                  'http://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/250px-House_Baratheon.svg.png',
                ),
                myCard(
                  "House Targaryen",
                  'https://vignette.wikia.nocookie.net/gameofthrones/images/4/43/House-Targaryen-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170510235320',
                ),
                myCard(
                 "b",
                  'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Lannister-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101095357',
                ),
              ]
          )
      ),
    );
  }*/
}

class HouseListState extends State<HouseList> {
  Map data;

//    _get() async {
//      Map result;
//    var httpClient = new HttpClient();
////  var uri = new Uri.http(
////      'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
//    var uri = new Uri.https('got-flutter.firebaseio.com', '/houses.json');
//    var request = await httpClient.getUrl(uri);
//    var response = await request.close();
//    var responseBody = await response.transform(UTF8.decoder).join();
//
//
//    if(!mounted) return;
//    this.setState((){
//      data = JSON.decode(responseBody);
//
//    });
//
//  }
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://got-flutter.firebaseio.com/houses.json"),
    );

    this.setState(() {
      data = JSON.decode(response.body);
    });
    print(data);

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
//     print(data.length);
//    List<String> housesNameList = data.keys.toList();
//    print(housesNameList);

    var size = MediaQuery
        .of(context)
        .size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    Card myCard(String houseName, String houseImageUrl) {
      return new Card(
          elevation: 5.0,
          child: new InkWell(
            child: new Container(
              alignment: Alignment.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    houseImageUrl,
                    height: 180.0,
                    width: itemWidth,
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
                    new SingleHousePage(houseName)),
              );
            },
          )
      );
    }

    return new Flexible(
        child: new Container(
            child: new GridView.builder(
                itemCount: data == null ? 0 : data.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  var housename = data.keys.toList()[index].toString();
                  return myCard(housename,data[housename]['image'].toString());
                }
            )
        )
//          ListView.builder(
//              itemCount: data == null ? 0 : 1,
//              itemBuilder: (BuildContext context, int index){
//                return new Container(
//                  child: new Center(
//                    child: new Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        new Card(
//                          child: new Text(data.length.toString()),
//                        ),
//                      ],
//                    ),
//                  ),
//                );

//                return new GridView.count(
//                    crossAxisSpacing: 10.0,
//                    crossAxisCount: 2,
//                    primary: false,
//                    shrinkWrap: true,
//                    controller: new ScrollController(keepScrollOffset: false),
//                    scrollDirection: Axis.vertical,
//                    childAspectRatio: (itemWidth / 250.0),
//                    padding: const EdgeInsets.all(10.0),
//
//                    children: <Widget>[
//                      myCard(
//                          data.length.toString(),
//                          'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101103142'),
//                      myCard("House Arryn",
//                          'https://vignette.wikia.nocookie.net/gameofthrones/images/1/15/House-Arryn-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101094153'),
//                      myCard(
//                        "House Tully",
//                        'https://vignette.wikia.nocookie.net/gameofthrones/images/b/bd/House-Tully-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170523040648',
//                      ),
//                      myCard(
//                        "House Baratheon",
//                        'http://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/250px-House_Baratheon.svg.png',
//                      ),
//                      myCard(
//                        "House Targaryen",
//                        'https://vignette.wikia.nocookie.net/gameofthrones/images/4/43/House-Targaryen-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170510235320',
//                      ),
//                      myCard(
//                        "b",
//                        'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Lannister-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101095357',
//                      ),
//                    ]
//                );
//              }
//          )
// GridView.count(
//              crossAxisSpacing: 10.0,
//              crossAxisCount: 2,
//              primary: false,
//              shrinkWrap: true,
//              controller: new ScrollController(keepScrollOffset: false),
//              scrollDirection: Axis.vertical,
//              childAspectRatio: (itemWidth / 250.0),
//              padding: const EdgeInsets.all(10.0),
//
//              children: <Widget>[
//                myCard(
//                    data.length.toString(),
//                    'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Stark-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101103142'),
//                myCard("House Arryn",
//                    'https://vignette.wikia.nocookie.net/gameofthrones/images/1/15/House-Arryn-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101094153'),
//                myCard(
//                  "House Tully",
//                  'https://vignette.wikia.nocookie.net/gameofthrones/images/b/bd/House-Tully-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170523040648',
//                ),
//                myCard(
//                  "House Baratheon",
//                  'http://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/250px-House_Baratheon.svg.png',
//                ),
//                myCard(
//                  "House Targaryen",
//                  'https://vignette.wikia.nocookie.net/gameofthrones/images/4/43/House-Targaryen-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170510235320',
//                ),
//                myCard(
//                 "b",
//                  'https://vignette.wikia.nocookie.net/gameofthrones/images/8/8a/House-Lannister-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101095357',
//                ),
//              ]
//          )
//      ),
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
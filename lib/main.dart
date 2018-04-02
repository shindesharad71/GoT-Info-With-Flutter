import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:layouts/MyHomePage.dart';
import 'package:layouts/NoConnectionPage.dart';

void main() => runApp(new MyApp());
var connect = false;

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Future<bool> getStatus() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    this.setState(() {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        connect = true;
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      title: 'Flutter Layouts',
      theme: new ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: new NoConnectionPage(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getStatus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

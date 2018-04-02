import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:layouts/MyHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    var connect = false;

    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connect = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connect = true;
    }

    return new MaterialApp(
      title: 'Flutter Layouts',
      theme: new ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: connect ? new MyHomePage() : new Text('No Connection!'),
    );
  }
}

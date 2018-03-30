import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layouts/MyHomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return new MaterialApp(
      title: 'Flutter Layouts',
      theme: new ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: new MyHomePage(),
    );
  }
}

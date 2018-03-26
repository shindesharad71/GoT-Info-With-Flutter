import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0.0, 86.0, 0.0, 0.0),
        child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator()
            ]
        )
    );
  }

}
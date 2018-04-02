import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Scaffold(
          body: new Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0.0, 86.0, 0.0, 0.0),
              child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      const IconData(0xe1ba, fontFamily: 'MaterialIcons'),
                      size: 50.0,
                      color: Colors.grey,
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: new Text(
                        'No Internet Connection!',
                        style: new TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      ),
                    )
                  ]))),
    );
  }
}

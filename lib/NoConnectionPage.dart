import 'package:flutter/material.dart';
import 'package:layouts/main.dart';

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
                    new Image.asset(
                      'assets/img/noconnection.png',
                      height: 180.0,
                      width: 180.0,
                      color: Colors.grey,
                      fit: BoxFit.cover,),

                    new Padding(
                      padding: const EdgeInsets.only(top:22.0),
                      child: new Text(
                        'No Internet Connection!',
                        style: new TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          fontSize: 18.0

                        ),
                      ),
                    ),
                    new IconButton(
                        icon: new Icon(Icons.refresh),
                        iconSize: 50.0,
                        color: Colors.grey,
                      onPressed: ()=>new MyApp(),
                    )
                  ]
              )
          )
      ),
    );
  }
}

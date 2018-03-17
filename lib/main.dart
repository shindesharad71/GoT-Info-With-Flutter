import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layouts',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Game of Thrones'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: new GridView.count(
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          primary: false,
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/7/72/House-Stark-heraldry.jpg/revision/latest/scale-to-width-down/480?cb=20140402121259',
                  ),
                  new Text('House Stark'),
                ],
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/1/15/House-Arryn-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170101094153',
                  ),
                  new Text('House Arryn'),
                ],
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/b/bd/House-Tully-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170523040648',
                  ),
                  new Text('House Tully'),
                ],
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'http://awoiaf.westeros.org/images/thumb/2/2d/House_Baratheon.svg/250px-House_Baratheon.svg.png',
                  ),
                  new Text('House Baratheon'),
                ],
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'https://i.ytimg.com/vi/LfPdmw64w5Q/maxresdefault.jpg',
                  ),
                  new Text('House Lannister'),
                ],
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Image.network(
                    'https://vignette.wikia.nocookie.net/gameofthrones/images/4/43/House-Targaryen-Main-Shield.PNG/revision/latest/scale-to-width-down/350?cb=20170510235320',
                  ),
                  new Text('House Targaryen'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

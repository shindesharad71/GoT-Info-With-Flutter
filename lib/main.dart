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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
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
                    'http://images.cdn.starpulse.com/news/bloggers/1279398/blog_images/arya-stark.jpg',
                  ),
                  new Text('Aarya Stark'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

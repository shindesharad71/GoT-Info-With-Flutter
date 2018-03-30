import 'package:flutter/material.dart';

class CustomContainer {
  final String image, text;
  final double itemWidth, itemHeight;

  CustomContainer(this.image, this.text, this.itemWidth, this.itemHeight);

  Container customFun() {
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: new Image.network(
              image,
              fit: BoxFit.contain,
              height: itemWidth,
              width: itemWidth,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Center(
              child: new Text(
                text,
                style: new TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
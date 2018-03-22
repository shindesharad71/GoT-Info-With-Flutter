import 'package:flutter/material.dart';
class CharDetails extends StatelessWidget{
  final String _characterName;

  CharDetails(this._characterName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(_characterName);
  }
}
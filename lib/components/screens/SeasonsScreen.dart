import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListSeasons.dart';

class SeasonsScreen extends StatelessWidget {
  final String _title = 'Seasons';
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(_title),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: ListSeasons());
  }
}

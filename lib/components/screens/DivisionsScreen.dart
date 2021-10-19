import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListDivisions.dart';

class DivisionsScreen extends StatelessWidget {
  final String _title = 'Divisions';
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
        body: ListDivisions());
  }
}

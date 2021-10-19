import 'package:flutter/material.dart';
import 'package:wlt3/components/lists/ListTiers.dart';

class TiersScreen extends StatelessWidget {
  final String _title = 'Tiers';
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
        body: ListTiers());
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String _title = 'Profile Screen';
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
      backgroundColor: Colors.orange,
      body: Center(
        child: Text(
          _title,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

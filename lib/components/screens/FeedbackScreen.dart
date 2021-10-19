import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final String _title = 'Feedback Screen';
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
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          _title,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

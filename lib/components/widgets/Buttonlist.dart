import 'package:flutter/material.dart';
import 'package:wlt3/libs/Themedata.dart';

class Buttonlist extends StatelessWidget {
  String? title = '';
  String? subtitle = '';

  ///
  ///
  ///
  Buttonlist({Key? key, @required this.title, @required this.subtitle})
      : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(5.0),
      color: Themedata.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Column(
              children: <Widget>[
                Text(
                  this.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(this.subtitle.toString().toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Themedata.blue,
                      fontSize: 12,
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

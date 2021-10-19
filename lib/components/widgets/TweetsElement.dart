import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/models/Tweet.dart';

class TweetsElement extends StatelessWidget {
  final Tweet tweet;

  ///
  ///
  ///
  TweetsElement({Key key, @required this.tweet}) : super(key: key);

  ///
  ///
  ///
  List<Widget> getText(BuildContext context)
  {
    return [
      Image.network(tweet?.profileImageUrl ?? ''),
      Text(tweet.text),
      SizedBox(height: 20),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          Text(tweet.screenName, 
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.bold)
          ),
          Text(tweet.date, 
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 14.0)
          ),
        ],
      ),    ];
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: getText(context),
        ),
      ),
      onTap: () => ActionsComposite.launchURL(tweet.url),
    );
  }
}

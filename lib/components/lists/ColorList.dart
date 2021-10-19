import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';

class ColorList extends StatelessWidget {
  ///
  ///
  ///
  @override
  ListView build(BuildContext context) {
    Map<String, Color> mycolors = Themedata.getAllColors();
    List<Widget> kids = [
      FlatButton(
        child: Text(
          '< back',
          style: TextStyle(fontSize: 25.0),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          Navigator.popUntil(context, (route) { ActionsComposite.lastRouteName = route.settings.name; return true; });
          Navigator.pushNamed(context, '/home');
        },
      )
    ];
    int i = 136;
    mycolors.forEach((final String key, final Color value) {
      i++;
      kids.add(DecoratedBox(
          decoration: BoxDecoration(color: value),
          child: Column(
            children: <Widget>[
              Text(i.toString() + ' : ' + key,
                  style: TextStyle(
                      height: 2, letterSpacing: 2, color: Themedata.white)),
              Text(i.toString() + ' : ' + key,
                  style: TextStyle(
                      height: 2, letterSpacing: 2, color: Themedata.black))
            ],
          )));
    });
    return ListView(children: kids);
  }
}

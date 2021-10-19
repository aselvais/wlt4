import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';

class Drawerwlt extends StatelessWidget {
  ///
  ///
  ///
  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.network(
                'http://www.winloseortie.com/wp-content/themes/pogon/images/WLT-Logo.jpg'),
            decoration: BoxDecoration(
              color: Themedata.white,
              border:
                  Border(bottom: BorderSide(color: Themedata.grey, width: 1.0)),
            ),
          ),
          /*
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              Navigator.pushNamed(context, '/feedback');
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          */
          ListTile(
            title: Text('Log out'),
            onTap: () {
              Navigator.popUntil(context, (route) { ActionsComposite.lastRouteName = route.settings.name; return true; });
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wlt3/libs/ActionsComposite.dart';

class LoginScreen extends StatelessWidget {
  final String imgUrl =
      'http://www.winloseortie.com/wp-content/themes/pogon/images/WLT-Logo.jpg';

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
              Container(
                padding: EdgeInsets.all(80.0),
                child: Image.network(
                  imgUrl, /*width: 200, height: 200,*/
                ),
              ),
              ((ActionsComposite.isLoading(context) == false)
                  ? FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        'Go',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () => ActionsComposite.loginToHome(context),
                    )
                  : CircularProgressIndicator()),
            ]))));
  }
}

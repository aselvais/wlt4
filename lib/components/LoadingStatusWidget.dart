import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
///
///
class LoadingStatusWidget extends StatelessWidget {
  ///
  ///
  ///
  Widget getLoadingWidget(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()));
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return LoadingStatusWidget();
  }
}

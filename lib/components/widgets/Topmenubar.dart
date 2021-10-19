import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';

class Topmenubar extends StatelessWidget with PreferredSizeWidget {
  ///
  ///
  ///
  @override
  AppBar build(BuildContext context) {
    final leagues = Provider.of<LeaguesModel>(context);
    League? league = leagues.selectedModel;
    String title = 'Win Lose or Tie';
    try {
      title = league?.name ?? 'Win Lose or Tie';
    } catch (er) {}
    return new AppBar(title: new Text(title), backgroundColor: Themedata.blue);
  }

  ///
  ///
  ///
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

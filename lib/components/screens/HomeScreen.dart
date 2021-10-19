import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/screens/FavoritesScreen.dart';
import 'package:wlt3/components/screens/GamesScreen.dart';
import 'package:wlt3/components/screens/LeaguesScreen.dart';
import 'package:wlt3/components/screens/StandingsScreen.dart';
import 'package:wlt3/components/widgets/Bottomnavigationwlt.dart';
import 'package:wlt3/components/widgets/Drawerwlt.dart';
import 'package:wlt3/components/widgets/Topmenubar.dart';
import 'package:wlt3/models/BottombarModel.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> _children = [
    GamesScreen(),
    StandingsScreen(),
    LeaguesScreen(),
    FavoritesScreen()
  ];

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<BottombarModel>(context);
    return new Scaffold(
        drawer: new Drawerwlt(),
        appBar: new Topmenubar(),
        body: _children[cart.idx],
        bottomNavigationBar: new Bottomnavigationwlt());
  }
}

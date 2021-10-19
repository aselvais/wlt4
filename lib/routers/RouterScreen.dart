import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/screens/DivisionsScreen.dart';
import 'package:wlt3/components/screens/FeedbackScreen.dart';
import 'package:wlt3/components/screens/GamedetailScreen.dart';
import 'package:wlt3/components/screens/HomeScreen.dart';
import 'package:wlt3/components/screens/LoginScreen.dart';
import 'package:wlt3/components/screens/ProfileScreen.dart';
import 'package:wlt3/components/screens/SeasonsScreen.dart';
import 'package:wlt3/components/screens/TeamdetailScreen.dart';
import 'package:wlt3/components/screens/TiersScreen.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/TiersModel.dart';

class RouterScreen extends StatelessWidget 
{

  FavoritesModel _favoritesModel = FavoritesModel();
  LeaguesModel _leaguesModel = LeaguesModel();
  SeasonsModel _seasonsModel = SeasonsModel();
  DivisionsModel _divisionsModel = DivisionsModel();
  TiersModel _tiersModel = TiersModel();
  GamesModel _gamesModel = GamesModel();
  StandingsModel _standingsModel = StandingsModel();
  TeamModel _teamModel = TeamModel();
  BottombarModel _bottombarModel = BottombarModel();
  MatchdatesModel _matchdatesModel = MatchdatesModel();

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    ActionsComposite.setGamesDataOnCachedSelection(
        _favoritesModel,
        _leaguesModel,
        _seasonsModel,
        _divisionsModel,
        _tiersModel,
        _matchdatesModel);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FavoritesModel>( create: (context) => _favoritesModel),
          ChangeNotifierProvider<LeaguesModel>( create: (context) => _leaguesModel),
          ChangeNotifierProvider<SeasonsModel>( create: (context) => _seasonsModel),
          ChangeNotifierProvider<DivisionsModel>( create: (context) => _divisionsModel),
          ChangeNotifierProvider<TiersModel>( create: (context) => _tiersModel),
          ChangeNotifierProvider<GamesModel>( create: (context) => _gamesModel),
          ChangeNotifierProvider<StandingsModel>( create: (context) => _standingsModel),
          ChangeNotifierProvider<TeamModel>( create: (context) => _teamModel),
          ChangeNotifierProvider<BottombarModel>( create: (context) => _bottombarModel),
          ChangeNotifierProvider<MatchdatesModel>( create: (context) => _matchdatesModel),
        ],
        child: MaterialApp(
            title: 'Win Lose or Tie',
            theme: new ThemeData(
              brightness: Brightness.light,
              backgroundColor: Themedata.white,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => new LoginScreen(),
              '/home': (context) => new HomeScreen(),
              '/seasons': (context) => SeasonsScreen(),
              '/divisions': (context) => DivisionsScreen(),
              '/tiers': (context) => TiersScreen(),
              '/feedback': (context) => new FeedbackScreen(),
              '/profile': (context) => new ProfileScreen(),
              '/gamedetail': (context) => new GamedetailScreen(),
              '/teamdetail': (context) => new TeamdetailScreen(),
            }));
  }
}

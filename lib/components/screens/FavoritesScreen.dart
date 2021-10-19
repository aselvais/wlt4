import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/components/widgets/TeamElement.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/Team.dart';

///
///
///
class FavoritesScreen extends StatelessWidget {

  ///
  /// Generic containing with list of elements inside (passed as param)
  ///
  Widget getContent(BuildContext context, Widget wl)
  {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Themedata.greyBackground,
      child: wl,
    );
  }

  ///
  ///
  ///
  Widget getEmptyContent(BuildContext context, String txt)
  {
    return getContent(context, Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.star_border,
            color: Colors.grey,
            size: 40,
          ),
          Text(
            txt, 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey, 
              fontSize: 20.0,
              ),
          ),
        ],
      ),
    ));
  }

  ///
  ///
  ///
  Widget getTeams(BuildContext context) {
    final favorites = Provider.of<FavoritesModel>(context);
    if (favorites.listTeams.length == 0)
      return getEmptyContent(context, '\nNothing here yet ...\n\nUse the star icon to add teams to your favorite.');
    else 
      return getContent(context, ListView(
          children: favorites.listTeams.map<Widget>((Team f) => (TeamElement(team: f))).toList(),
      ));
  }

  ///
  ///
  ///
  Widget getGames(BuildContext context) {
    final favorites = Provider.of<FavoritesModel>(context);
    if (favorites.listGames.length == 0)
      return getEmptyContent(context, '\nNothing here yet ...\n\nUse the star icon to add games to your favorite.');
    else 
      return getContent(context, 
        RefreshIndicator(
          child: ListView(children: favorites.listGames.map<Widget>((Game f) => (GameElement(game: f))).toList(),),
          onRefresh: () => ActionsComposite.reloadGamesFromFavorites(context),
        ),
      );
  }

  ///
  ///
  ///
  Widget getTabsView(BuildContext context) {
    return Expanded(
      flex: 7,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: 'Teams',),
                  Tab(text: 'Games',)
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              getTeams(context),
              getGames(context),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getAppBarElement(BuildContext context) {
    return AppBar(
      title: new Text('Favorites'),
      backgroundColor: Colors.black,
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[getTabsView(context)],);
  }
  
}

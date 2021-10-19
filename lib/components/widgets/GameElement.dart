import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/FormaterElem.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';

class GameElement extends StatelessWidget {
  final Game? game;

  ///
  ///
  ///
  GameElement({Key? key, @required this.game}) : super(key: key);

  ///
  ///
  ///
  Widget getTeamTitle(String txt, bool isWinner) {
    TextStyle stl;
    if (isWinner == true)
      stl = TextStyle(
          color: Themedata.blue, fontSize: 14.0, fontWeight: FontWeight.bold);
    else
      stl = TextStyle(color: Themedata.black, fontSize: 14.0);
    String tt = '';
    List<String> t = (txt?.toUpperCase() ?? '').split(" ");
    for (int i = 0; i < t.length; i++) {
      if (i < t.length - 1)
        tt += t[i] + " ";
      else
        tt += "\n" + t[i];
    }
    return Container(padding: EdgeInsets.all(8.0), child: Text(tt, style: stl));
  }

  ///
  ///
  ///
  Widget getBottomInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Column(
              children: <Widget>[
                Text(
                    ((game?.leagueShortName != null)
                        ? game?.leagueShortName?.toUpperCase() ?? ''
                        : ''),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Themedata.blue,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold)),
                Text(
                    ((game?.seasonName != null)
                            ? game?.seasonName?.toUpperCase() ?? ''
                            : '') +
                        ' | ' +
                        ((game?.seasonName != null)
                            ? game?.divisionName?.toUpperCase() ?? ''
                            : ''),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Themedata.black, fontSize: 12.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///
  ///
  ///
  Widget getTheIcon(BuildContext context, String iconName, bool isOn) {
    IconData i;
    if (iconName == 'star') {
      final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
      return (favorites.isInGamesFavorite(game?.id) == true)
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(
              Icons.star_border,
              color: Colors.grey,
            );
    }
    if (iconName == 'location') {
      i = Icons.location_on;
      return Icon(
        i,
        color: Colors.grey,
      );
    }
    return Container();
  }

  ///
  ///
  ///
  Widget getScoreTxt(String txt) {
    if (txt == 'null') txt = '-';
    return Text(txt, style: TextStyle(color: Themedata.grey, fontSize: 25.0));
  }

  ///
  ///
  ///
  Widget getGameRow(BuildContext context, Image img0, String teamName, bool g01,
      String score, String gamedateTime, String gameinfo) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: (img0 == null) ? Container() : img0,
        ),
        Expanded(
          flex: 4,
          child: this.getTeamTitle(teamName, g01),
        ),
        Expanded(flex: 2, child: this.getScoreTxt(score)),
        (gamedateTime != null)
            ? Expanded(
                flex: 4,
                child: Text(FormaterElem.getDateFormated(gamedateTime, true)),
              )
            : Expanded(
                flex: 4,
                child: Text(gameinfo),
              ),
      ],
    );
  }

  ///
  ///
  ///
  Widget getButton(BuildContext context) {
    bool g01, g02 = false;
    Image img01, img02;
    try {
      g01 = (game.info.team1.score > game.info.team2.score);
    } catch (eee) {}
    try {
      g02 = (game.info.team1.score <= game.info.team2.score);
    } catch (eee) {}
    try {
      img01 = Image.network(game.info.team1.imageUrl, width: 25, height: 25);
    } catch (eee) {}
    try {
      img02 = Image.network(game.info.team2.imageUrl, width: 25, height: 25);
    } catch (eee) {}
    return Row(
      children: <Widget>[
        Expanded(
          flex: 11,
          child: InkWell(
            child: Column(
              children: <Widget>[
                this.getGameRow(context, img01, game.info.team1.teamName, g01,
                    game.info.team1.score.toString(), game.dateTime, null),
                this.getGameRow(
                  context,
                  img02,
                  game.info.team2.teamName,
                  g02,
                  game.info.team2.score.toString(),
                  null,
                  game.arena.name + "\n" + game?.status?.toUpperCase() ?? '',
                ),
                (game.seasonName != null)
                    ? this.getBottomInfo(context)
                    : Container(),
              ],
            ),
            onTap: () => ActionsComposite.goToGameDetailScreen(context, game),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: this.getTheIcon(context, 'star', false)),
                onTap: () => ActionsComposite.onTapGameFavorite(context, game),
              ),
              InkWell(
                child: Container(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: this.getTheIcon(context, 'location', false)),
                onTap: () => ActionsComposite.goToMaps(context, game.arena),
              ),
            ],
          ),
        )
      ],
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final gamesModel = Provider.of<GamesModel>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      // height: 100,
      child: (ActionsComposite.isLoading(context) == true &&
              gamesModel.selectedId == game.id)
          ? Center(child: CircularProgressIndicator())
          : getButton(context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/FormaterElem.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/Team.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:share/share.dart';

class GamedetailScreen extends StatelessWidget {
  final String _title = 'Game detail';

  ///
  /// Triggered when tapping a team in the top bar
  ///
  onTapTeam(BuildContext context, Team team) {
    ActionsComposite.goToTeamDetailScreen(context, team.teamId);
  }

  ///
  /// Triggered when tapping the calendar in the "tab bar"
  ///
  onTapCalendar(BuildContext context) {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    DateTime dt = DateTime.parse(game.dateTime);
    DateTime dt2 = dt.add(new Duration(hours: 1));
    final Event event = Event(
      title: game.info.team1.teamName + ' vs ' + game.info.team2.teamName,
      description: 'Hockey match ' +
          game.info.team1.teamName +
          ' vs ' +
          game.info.team2.teamName +
          ' at ' +
          game.arena.address,
      location: game.arena.address,
      startDate: dt,
      endDate: dt2,
    );
    try {
      Add2Calendar.addEvent2Cal(event);
    } catch (eee) {
      print('Error adding event');
    }
  }

  ///
  /// Triggered when tapping the map icon in the tab bar
  ///
  onTapMap(BuildContext context) async {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    ActionsComposite.goToMaps(context, game.arena);
  }

  ///
  /// Triggered when tapping the share icon in the tab bar
  ///
  onTapShare(BuildContext context) {
    final Game selectedGame = Provider.of<GamesModel>(context).selectedModel;
    String title = 'Match ' +
        selectedGame.info.team1.teamName +
        ' vs. ' +
        selectedGame.info.team2.teamName;
    //String url = selectedGame.shareUrl;
    String message = '';

    // Past Game (Teams tied in score) // "Team A" tied"Team B", "Score", on "Date", "Location Name"
    if ((selectedGame.info.team1.score != null) &&
        (selectedGame.info.team2.score != null) &&
        selectedGame.info.team1.score == selectedGame.info.team2.score) {
      message = selectedGame.info.team1.teamName +
          ' tied ' +
          selectedGame.info.team2.teamName +
          ' ' +
          selectedGame.info.team1.score.toString() +
          '-' +
          selectedGame.info.team2.score.toString() +
          ' at ' +
          selectedGame.arena.name +
          ' ' +
          selectedGame.arena.address +
          " on " +
          FormaterElem.getDateFormated(selectedGame.dateTime, true)
              .replaceAll("\n", " ");
    }
    // Past Game (One team defeats the other team) // "Team B" defeated "Team A", "Score", on "Date", "Location Name"
    else if ((selectedGame.info.team1.score != null) &&
        (selectedGame.info.team2.score != null) &&
        selectedGame.info.team1.score != selectedGame.info.team2.score) {
      message = selectedGame.info.team1.score > selectedGame.info.team2.score
          ? selectedGame.info.team1.teamName +
              ' defeats ' +
              selectedGame.info.team2.teamName +
              ' ' +
              selectedGame.info.team1.score.toString() +
              '-' +
              selectedGame.info.team2.score.toString() +
              ' at ' +
              selectedGame.arena.name +
              ' ' +
              selectedGame.arena.address +
              " on " +
              FormaterElem.getDateFormated(selectedGame.dateTime, true)
                  .replaceAll("\n", " ")
          : selectedGame.info.team2.teamName +
              ' defeats ' +
              selectedGame.info.team1.teamName +
              ' ' +
              selectedGame.info.team2.score.toString() +
              '-' +
              selectedGame.info.team1.score.toString() +
              ' at ' +
              selectedGame.arena.name +
              ' ' +
              selectedGame.arena.address +
              " on " +
              FormaterElem.getDateFormated(selectedGame.dateTime, true)
                  .replaceAll("\n", " ");
    }
    // Future Game // "Team A" vs "Team B" @"Time", "Location Name"
    else {
      message = selectedGame.info.team1.teamName +
          ' vs ' +
          selectedGame.info.team2.teamName +
          " @" +
          FormaterElem.getDateFormated(selectedGame.dateTime, true)
              .replaceAll("\n", " ") +
          ' at ' +
          selectedGame.arena.name +
          ' ' +
          selectedGame.arena.address;
    }
    // title, message, url
    Share.share(message, subject: title);
  }

  ///
  ///
  ///
  Widget getTopBar(BuildContext context) {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return Container(
        //margin: const EdgeInsets.all(5.0),
        height: 200,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(10.0),
        color: Colors.black,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 5, child: this.getTeam(context, game.info.team1)),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Text('vs.', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
                Expanded(
                    flex: 5, child: this.getTeam(context, game.info.team2)),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                  (game?.leagueName ?? '').toUpperCase() +
                      " | " +
                      (game?.divisionName ?? '').toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),
            ),
          ],
        )));
  }

  ///
  ///
  ///
  Widget getTeam(BuildContext context, Team gameinfoteam) {
    return InkWell(
      onTap: () => onTapTeam(context, gameinfoteam),
      child: Column(
        children: <Widget>[
          Image.network(gameinfoteam?.imageUrl ?? "", width: 80, height: 80),
          Text(gameinfoteam.teamName.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          Text(
              gameinfoteam.win.toString() +
                  '-' +
                  gameinfoteam.lose.toString() +
                  '-' +
                  gameinfoteam.draw.toString() +
                  '(' +
                  (gameinfoteam?.positionElementInStandings ?? '-').toString() +
                  ') | strk:' +
                  (gameinfoteam?.streak ?? ' -').toString(),
              style: TextStyle(color: Colors.white)),
          Text(gameinfoteam?.score?.toString() ?? "-",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 34)),
        ],
      ),
    );
  }

  ///
  ///
  ///
  Widget getButton(
      BuildContext context, IconData ico, String label, action, icocolor) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        child: Column(
          children: <Widget>[
            Icon(ico, color: icocolor),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 8.0)),
          ],
        ),
        onTap: action,
      ),
    );
  }

  ///
  ///
  ///
  Widget getMenuBar(BuildContext context) {
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    bool isInFavorite = favorites.isInGamesFavorite(game.id);

    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: this.getButton(
                    context,
                    Icons.calendar_today,
                    'ADD TO CALENDAR',
                    () => onTapCalendar(context),
                    Colors.white),
              ),
              Expanded(
                flex: 1,
                child: this.getButton(context, Icons.location_on, 'VIEW ON MAP',
                    () => onTapMap(context), Colors.white),
              ),
              Expanded(
                flex: 1,
                child: this.getButton(context, Icons.share, 'SHARE',
                    () => onTapShare(context), Colors.white),
              ),
              Expanded(
                  flex: 1,
                  child: (isInFavorite
                      ? (this.getButton(
                          context,
                          Icons.star,
                          'FAVORITE',
                          () =>
                              ActionsComposite.onTapGameFavorite(context, game),
                          Colors.yellow))
                      : (this.getButton(
                          context,
                          Icons.star_border,
                          'FAVORITE',
                          () =>
                              ActionsComposite.onTapGameFavorite(context, game),
                          Colors.white)))),
            ],
          ),
        ));
  }

  ///
  ///
  ///
  Widget getTitle(String txt) {
    return Container(
        padding: const EdgeInsets.all(13.0),
        child: Text(txt,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)));
  }

  ///
  ///
  ///
  getContentData(BuildContext context) {
    final Game game = Provider.of<GamesModel>(context).selectedModel;
    return <Widget>[
      this.getTitle('DATE / TIME'),
      Text(FormaterElem.getDateFormated(game.dateTime, true)
          .replaceAll("\n", " ")),
      Text(game?.status ?? ""),
      this.getTitle('ARENA'),
      Text(game?.arena?.name ?? ""),
      Text(game?.arena?.address ?? ""),
      this.getTitle('LEAGUE'),
      Text(game?.leagueShortName ?? ""),
      this.getTitle('SEASON'),
      Text(game?.seasonName ?? ""),
      this.getTitle('DIVISION'),
      Text(game?.divisionName ?? ""),
    ];
  }

  ///
  ///
  ///
  Widget getContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(25.0),
      padding: const EdgeInsets.all(30.0),
      width: MediaQuery.of(context).size.width,
      child: (ActionsComposite.isLoading(context) == true)
          ? Center(child: CircularProgressIndicator())
          : Column(children: this.getContentData(context)),
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text(_title),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Themedata.greyBackground,
        body: RefreshIndicator(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              this.getTopBar(context),
              this.getMenuBar(context),
              this.getContent(context),
            ],
          )),
          onRefresh: () => ActionsComposite.reloadCurrentSelectedGame(context),
        ));
  }
}

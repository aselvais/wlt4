import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt3/components/lists/ListStandingsTables.dart';
import 'package:wlt3/components/widgets/GameElement.dart';
import 'package:wlt3/components/widgets/NewsElement.dart';
import 'package:wlt3/components/widgets/TweetsElement.dart';
import 'package:wlt3/libs/ActionsComposite.dart';
import 'package:wlt3/libs/Themedata.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/Gamesdata.dart';
import 'package:wlt3/models/News.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Tweet.dart';

class TeamdetailScreen extends StatelessWidget {
  ///
  ///
  ///
  Widget getPreviousGames(BuildContext context, TeamModel teams) {
    final Gamesdata? gamesdata = teams.selectedModel?.games;
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
          children: gamesdata.past
              .map<Widget>((Game f) => (GameElement(game: f)))
              .toList(),
        ));
  }

  ///
  ///
  ///
  Widget getTodaysGames(BuildContext context, TeamModel teams) {
    final Gamesdata? gamesdata = teams.selectedModel?.games;
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Themedata.greyBackground,
      child: RefreshIndicator(
        child: ListView(
          children: gamesdata.today
              .map<Widget>((Game f) => (GameElement(game: f)))
              .toList(),
        ),
        onRefresh: () => ActionsComposite.reloadGamesToday(context),
      ),
    );
  }

  ///
  ///
  ///
  Widget getFutureGames(BuildContext context, TeamModel teams) {
    final Gamesdata? gamesdata = teams.selectedModel?.games;
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
            children: [
          (gamesdata.today.length > 0)
              ? Text(
                  'TODAY',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              : null,
          (gamesdata.today.length > 0)
              ? Column(
                  children: gamesdata.today
                      .map<Widget>((Game f) => (GameElement(game: f)))
                      .toList(),
                )
              : null,
          (gamesdata.upcoming.length > 0)
              ? Text(
                  'UPCOMING',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                )
              : null,
          (gamesdata.upcoming.length > 0)
              ? Column(
                  children: gamesdata.upcoming
                      .map<Widget>((Game f) => (GameElement(game: f)))
                      .toList(),
                )
              : null,
        ].where((t) => t != null).toList()));
  }

  ///
  ///
  ///
  Widget getStandings(BuildContext context, TeamModel teams) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      color: Themedata.greyBackground,
      child: ListStandingsTables(),
    ));
  }

  ///
  ///
  ///
  Widget getNews(BuildContext context, TeamModel teams) {
    final List<News>? news = teams.selectedModel?.news;
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
          children:
              news.map<Widget>((News f) => (NewsElement(news: f))).toList(),
        ));
  }

  ///
  ///
  ///
  Widget getTweets(BuildContext context, TeamModel teams) {
    final List<Tweet>? tweets = teams.selectedModel?.tweets;
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Themedata.greyBackground,
        child: ListView(
          children: tweets
              .map<Widget>((Tweet f) => (TweetsElement(tweet: f)))
              .toList(),
        ));
  }

  ///
  ///
  ///
  Widget getTabsView(BuildContext context, TeamModel teams) {
    int gamesPastLength = 0;
    int gamesTodayLength = 0;
    int gamesUpcomingLength = 0;
    int standingsLength = 1;
    int newsLength = 0;
    int tweetsLength = 0;
    List<Widget> headerWidgets = [];
    List<Widget> contentWidget = [];

    gamesPastLength = teams.selectedModel?.games?.past?.length ?? 0;
    gamesTodayLength = teams.selectedModel?.games?.today?.length ?? 0;
    gamesUpcomingLength = teams.selectedModel?.games?.upcoming?.length ?? 0;
    newsLength = teams.selectedModel?.news?.length ?? 0;
    tweetsLength = teams.selectedModel?.tweets?.length ?? 0;

    /* ------------------------------------------------------- */
    if (gamesPastLength > 0) {
      headerWidgets.add(Tab(
        text: 'Past Games',
      ));
      contentWidget.add(getPreviousGames(context, teams));
    }
    /* if (gamesTodayLength > 0) {
      headerWidgets.add(Tab(
        text: 'Today\'s Games',
      ));
      contentWidget.add(getTodaysGames(context, teams));
    } */
    if (gamesUpcomingLength > 0) {
      headerWidgets.add(Tab(
        text: 'Upcoming Games',
      ));
      contentWidget.add(getFutureGames(context, teams));
    }
    if (standingsLength > 0) {
      headerWidgets.add(Tab(
        text: 'Standings',
      ));
      contentWidget.add(getStandings(context, teams));
    }
    if (newsLength > 0) {
      headerWidgets.add(Tab(
        text: 'News',
      ));
      contentWidget.add(getNews(context, teams));
    }
    if (tweetsLength > 0) {
      headerWidgets.add(Tab(
        text: 'Tweets',
      ));
      contentWidget.add(getTweets(context, teams));
    }

    /* ------------------------------------------------------- */
    return Expanded(
      flex: 7,
      child: DefaultTabController(
        length: contentWidget.length,
        child: Scaffold(
          appBar: new PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppBar(
                automaticallyImplyLeading: false,
                // backgroundColor: Colors.black,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: headerWidgets,
                ),
              )),
          body: TabBarView(
            children: contentWidget,
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getButtons(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'Past Games',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'Standings',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Icon(Icons.favorite, color: Colors.white),
                Text(
                  'News',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getBodyElement(BuildContext context, TeamModel teams) {
    final Team? team = teams.selectedModel?.teaminfo;
    return Expanded(
      flex: 7,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Text(
            team.teamName, // _title,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget getButton(
      BuildContext context, IconData ico, String label, action, icocolor) {
    return Container(
      alignment: Alignment(0.0, -1.0),
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(ico, color: icocolor),
          ],
        ),
        onTap: action,
      ),
    );
  }

  ///
  ///
  ///
  Widget getHeaderElement(BuildContext context, TeamModel teams) {
    final Team? team = teams.selectedModel?.teaminfo;
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    bool isInFavorite = favorites.isInTeamsFavorite(team.teamId);
    return Expanded(
      flex: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(''),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: <Widget>[
                    Image.network(team?.imageUrl ?? "", width: 70, height: 70),
                    Text(team.teamName + " | " + team.divisionName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    Text(
                        team.win.toString() +
                            '-' +
                            team.lose.toString() +
                            '-' +
                            team.draw.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: (isInFavorite
                    ? this.getButton(
                        context,
                        Icons.star,
                        'FAVORITE',
                        () => ActionsComposite.onTapTeamFavorite(
                            context, team, false),
                        Colors.yellow)
                    : this.getButton(
                        context,
                        Icons.star_border,
                        'FAVORITE',
                        () => ActionsComposite.onTapTeamFavorite(
                            context, team, true),
                        Colors.white)),
              ),
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
      title: new Text('Team detail'),
      backgroundColor: Colors.black,
    );
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    final teams = Provider.of<TeamModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarElement(context),
      body: ((ActionsComposite.isLoading(context) == false)
          ? Column(
              children: <Widget>[
                getHeaderElement(context, teams),
                getTabsView(context, teams)
              ],
            )
          : Center(child: CircularProgressIndicator())),
    );
  }
}

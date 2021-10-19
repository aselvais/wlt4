import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wlt3/models/Arena.dart';
import 'package:wlt3/models/BottombarModel.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/DivisionsModel.dart';
import 'package:wlt3/models/FavoritesModel.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/GamesModel.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/LeaguesModel.dart';
import 'package:wlt3/models/MatchdatesModel.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/SeasonsModel.dart';
import 'package:wlt3/models/StandingsModel.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/TeamModel.dart';
import 'package:wlt3/models/Tiers.dart';
import 'package:wlt3/models/TiersModel.dart';

///
/// Class gathering commong actions we might use
/// from different parts of the application
///
class ActionsComposite {
  static String lastRouteName = Navigator.defaultRouteName;

  ///
  /// go to team detail screen (from different location: favorites, standings, ...)
  ///
  static goToTeamDetailScreen(BuildContext context, int? teamId) async {
    final TeamModel teammodel = Provider.of<TeamModel>(context);
    final StandingsModel standing = Provider.of<StandingsModel>(context);
    teammodel.selectedId = teamId;
    Navigator.pushNamed(context, '/teamdetail');
    await teammodel.loadData(teamId);
    standing.loadData(teammodel?.selectedModel?.teaminfo?.divisionId ?? -1,
        teammodel?.selectedModel?.teaminfo?.tierId ?? -1);
  }

  ///
  /// Go to game detail screen (from games list used everywhere; favorites, games and so on)
  /// @todo load the latest version of the game data
  ///
  static goToGameDetailScreen(BuildContext context, Game game) async {
    final gamesModel = Provider.of<GamesModel>(context);
    gamesModel.selectedId = game.id;
    gamesModel.selectedModel = game;
    gamesModel.loadOneGameData(game.id);
    Navigator.pushNamed(context, '/gamedetail');
  }

  ///
  /// go to games home screen
  ///
  static goToGamesHomeScreen(BuildContext context, Division model) async {
    final BottombarModel cart = Provider.of<BottombarModel>(context);
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    final DivisionsModel divisions = Provider.of<DivisionsModel>(context);
    final BottombarModel bottomModel = Provider.of<BottombarModel>(context);
    final GamesModel games = Provider.of<GamesModel>(context);
    final SeasonsModel seasons = Provider.of<SeasonsModel>(context);
    final MatchdatesModel matchdatesModel =
        Provider.of<MatchdatesModel>(context);
    final TiersModel tiers = Provider.of<TiersModel>(context);
    final StandingsModel standing = Provider.of<StandingsModel>(context);

    divisions.selectedId = model.id;
    divisions.selectedModel = model;
    favorites.lastSelectedDivision = model;

    // loading game dates
    await matchdatesModel.loadData(
        seasons.selectedModel.id, divisions.selectedModel.id);
    // loading standings
    await tiers.loadData(divisions?.selectedModel?.id ?? -1);
    await standing.loadData(model.id, tiers?.selectedModel?.id ?? -1);
    // loading games
    await games.loadData(seasons.selectedModel.id, divisions.selectedModel.id);
    matchdatesModel.selectedDate = DateTime.now();
    ActionsComposite.loadClosestGamesToDate(context, true, true);
    bottomModel.idx = 0;

    cart.idx = cart.previousidx;
    Navigator.popUntil(context, (route) {
      ActionsComposite.lastRouteName = route.settings.name;
      return true;
    });
    print(ActionsComposite.lastRouteName);
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  ///
  /// Reload games in the games page
  ///
  static reloadGames(BuildContext context) async {
    final GamesModel games = Provider.of<GamesModel>(context);
    final DivisionsModel divisions = Provider.of<DivisionsModel>(context);
    final SeasonsModel seasons = Provider.of<SeasonsModel>(context);
    await games.loadData(seasons.selectedModel.id, divisions.selectedModel.id);
  }

  ///
  ///
  ///
  static reloadGamesFromFavorites(BuildContext context) async {
    //@todo To be implemented
  }

  static reloadCurrentSelectedGame(BuildContext context) async {
    //@todo To be implemented
  }

  static reloadGamesToday(BuildContext context) async {
    //@todo To be implemented
  }

  ///
  /// set games data on cached selection
  ///
  static setGamesDataOnCachedSelection(
      FavoritesModel _favoritesModel,
      LeaguesModel _leaguesModel,
      SeasonsModel _seasonsModel,
      DivisionsModel _divisionsModel,
      TiersModel _tiersModel,
      MatchdatesModel _matchdatesModel) async {
    await _favoritesModel.read();
    await _leaguesModel.loadData();
    // Leagues pre-selection
    _leaguesModel.selectedModel = _favoritesModel?.lastSelectedLeague ?? null;
    _leaguesModel.selectedId = _favoritesModel?.lastSelectedLeague?.id ?? -1;
    // Season
    await _seasonsModel.loadData(_leaguesModel.selectedId);
    _seasonsModel.selectedModel = _favoritesModel?.lastSelectedSeason ?? null;
    _seasonsModel.selectedId = _favoritesModel?.lastSelectedSeason?.id ?? -1;
    // Division
    await _divisionsModel.loadData(_seasonsModel.selectedId);
    _divisionsModel.selectedModel =
        _favoritesModel?.lastSelectedDivision ?? null;
    _divisionsModel.selectedId =
        _favoritesModel?.lastSelectedDivision?.id ?? -1;
    // loading game dates
    if (_seasonsModel.selectedModel != null &&
        _divisionsModel.selectedModel != null) {
      await _matchdatesModel.loadData(
          _seasonsModel.selectedModel.id, _divisionsModel.selectedModel.id);
    } else {
      print(
          'Error in setGamesDataOnCachedSelection - can not load matches data');
    }
  }

  ///
  /// go to season screen
  ///
  static goToSeasonScreen(BuildContext context, League item) async {
    final LeaguesModel _list = Provider.of<LeaguesModel>(context);
    final SeasonsModel _list2 = Provider.of<SeasonsModel>(context);
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    _list.selectedId = item.id;
    _list.selectedModel = item;
    favorites.lastSelectedLeague = item;
    _list2.loadData(item.id);
    Navigator.pushNamed(context, '/seasons');
  }

  ///
  /// go to divisions screen
  ///
  static goToDivisionsScreen(BuildContext context, Season model) async {
    final SeasonsModel _list = Provider.of<SeasonsModel>(context);
    final DivisionsModel _list2 = Provider.of<DivisionsModel>(context);
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);

    _list.selectedId = model.id;
    _list.selectedModel = model;
    favorites.lastSelectedSeason = model;
    _list2.loadData(model.id);
    Navigator.pushNamed(context, '/divisions');
  }

  ///
  /// tiers to standings
  ///
  static tiersToStandings(BuildContext context, Tiers model) async {
    final TiersModel tiers = Provider.of<TiersModel>(context);
    final BottombarModel bottomModel = Provider.of<BottombarModel>(context);
    final StandingsModel standing = Provider.of<StandingsModel>(context);
    final DivisionsModel divisions = Provider.of<DivisionsModel>(context);

    tiers.selectedId = model.id;
    tiers.selectedModel = model;
    bottomModel.idx = 1;
    standing.loadData(divisions.selectedModel.id, tiers.selectedModel.id);
    Navigator.popUntil(context, (route) {
      ActionsComposite.lastRouteName = route.settings.name;
      return true;
    });
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  ///
  /// login to home
  ///
  static loginToHome(BuildContext context) async {
    final LeaguesModel _leaguesModel = Provider.of<LeaguesModel>(context);
    final SeasonsModel _seasonsModel = Provider.of<SeasonsModel>(context);
    final DivisionsModel _divisionsModel = Provider.of<DivisionsModel>(context);
    final BottombarModel _bottombarModel = Provider.of<BottombarModel>(context);
    final TiersModel tiers = Provider.of<TiersModel>(context);
    final StandingsModel standing = Provider.of<StandingsModel>(context);
    final GamesModel games = Provider.of<GamesModel>(context);

    await _leaguesModel.loadData();
    if (_leaguesModel.selectedId > -1 &&
        _seasonsModel.selectedId > -1 &&
        _divisionsModel.selectedId > -1) {
      _bottombarModel.idx = 0;

      // loading standings
      try {
        await tiers.loadData(_divisionsModel?.selectedModel?.id ?? -1);
        int tiersId = 0;
        try {
          tiersId = tiers.selectedModel.id;
        } catch (eee) {}
        standing.loadData(_divisionsModel?.selectedModel?.id, tiersId);
      } catch (ee) {}
      // await ActionsComposite.reloadGamesData(context);
      await ActionsComposite.loadClosestGamesToDate(context, true, true);
    } else {
      _bottombarModel.idx = 2;
    }
    Navigator.pushNamed(context, '/home');
  }

  ///
  /// go to tiers screen
  ///
  static goToTiersScreen(BuildContext context) async {
    final TiersModel tiers = Provider.of<TiersModel>(context);
    final DivisionsModel divisions = Provider.of<DivisionsModel>(context);

    tiers.loadData(divisions.selectedModel.id);
    Navigator.pushNamed(context, '/tiers');
  }

  ///
  /// on bottom nav item tapped
  ///
  static onBottomNavItemTapped(context, int index) async {
    final BottombarModel cart = Provider.of<BottombarModel>(context);
    final StandingsModel standing = Provider.of<StandingsModel>(context);
    final DivisionsModel divisions = Provider.of<DivisionsModel>(context);
    final TiersModel tiers = Provider.of<TiersModel>(context);
    final LeaguesModel leagues = Provider.of<LeaguesModel>(context);

    cart.idx = index;
    if (index == 1) // Standings
    {
      await tiers.loadData(divisions?.selectedModel?.id ?? -1);
      int tiersId = 0;
      try {
        tiersId = tiers.selectedModel.id;
      } catch (eee) {}
      try {
        await standing.loadData(divisions.selectedModel.id, tiersId);
      } catch (eee) {}
    }
    if (index == 2) // Leagues
    {
      await leagues.loadData();
    }
  }

  ///
  /// reload games data
  ///
  static reloadGamesData(BuildContext context) async {
    final GamesModel games = Provider.of<GamesModel>(context);
    final Season season = Provider.of<SeasonsModel>(context).selectedModel;
    final Division division =
        Provider.of<DivisionsModel>(context).selectedModel;
    await games.loadData(season.id, division.id);
  }

  ///
  /// Load the games (in games screen) to the closest available date
  ///
  static loadClosestGamesToDate(
      BuildContext context, bool right, bool allowCurrent) async {
    final GamesModel games = Provider.of<GamesModel>(context);
    final MatchdatesModel matchdatesModel =
        Provider.of<MatchdatesModel>(context);
    games.selectedDate.subtract(new Duration(days: 1));
    games.selectedDate =
        matchdatesModel.getClosestDate(games.selectedDate, right, allowCurrent);
    await ActionsComposite.reloadGamesData(context);
  }

  ///
  /// Launch map for an arean (passed as param)
  ///
  static goToMaps(BuildContext context, Arena arena) async {
    final availableMaps = await MapLauncher.installedMaps;
    // @todo choise the right one
    // print(availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

    num lat = arena?.latitude ?? 0;
    num long = arena?.longitude ?? 0;

    if (lat != 0 && long != 0) {
      await availableMaps.first.showMarker(
        coords: Coords(lat, long),
        title: arena?.name ?? '',
        description: arena?.address ?? '',
      );
    }
  }

  ///
  /// on tap game favorite
  ///
  static onTapGameFavorite(BuildContext context, Game game) {
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    if (favorites.isInGamesFavorite(game.id) == false)
      favorites.addToListGames(game);
    else
      favorites.removeFromListGames(game);
  }

  ///
  /// on tap team favorite
  ///
  static onTapTeamFavorite(BuildContext context, Team team, bool add2fav) {
    final FavoritesModel favorites = Provider.of<FavoritesModel>(context);
    if (add2fav == true)
      favorites.addToListTeams(team);
    else
      favorites.removeFromListTeams(team);
  }

  ///
  /// select date
  ///
  static Future<void> selectDate(BuildContext context) async {
    final GamesModel games = Provider.of<GamesModel>(context);
    final MatchdatesModel matchdates = Provider.of<MatchdatesModel>(context);
    List<DateTime> availableDates = matchdates.getListOfAvailableDates();
    DateTime firstDate = DateTime(2016);
    DateTime lastDate = DateTime(2025);
    DateTime initialDate = games.selectedDate;
    Function selectableDayPredicate;
    if (availableDates.length > 0) {
      try {
        firstDate = availableDates[0];
      } catch (ee) {}
      try {
        lastDate = availableDates[availableDates.length - 1];
      } catch (ee) {}
      if (initialDate.isBefore(firstDate) || initialDate.isAfter(lastDate)) {
        initialDate = firstDate;
      }
      selectableDayPredicate =
          (s) => (availableDates.indexOf(s) < 0) ? false : true;
    }
    try {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          selectableDayPredicate: selectableDayPredicate);

      if (picked != null && picked != games.selectedDate) {
        games.selectedDate = picked;
        await ActionsComposite.reloadGamesData(context);
      }
    } catch (ee) {}
  }

  ///
  /// Launch an URL
  ///
  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ///
  ///
  ///
  static bool isLoading(BuildContext context) {
    final _leaguesModel = Provider.of<LeaguesModel>(context);
    final _seasonsModel = Provider.of<SeasonsModel>(context);
    final _divisionsModel = Provider.of<DivisionsModel>(context);
    final _gamesModel = Provider.of<GamesModel>(context);
    final _standingsModel = Provider.of<StandingsModel>(context);
    final _matchdatesModel = Provider.of<MatchdatesModel>(context);
    final _teamModel = Provider.of<TeamModel>(context);
    final _tiersModel = Provider.of<TiersModel>(context);

    if (_leaguesModel.loading == true ||
        _seasonsModel.loading == true ||
        _divisionsModel.loading == true ||
        _gamesModel.loading == true ||
        _standingsModel.loading == true ||
        _matchdatesModel.loading == true ||
        _teamModel.loading == true ||
        _tiersModel.loading == true)
      return true;
    else
      return false;
  }
}

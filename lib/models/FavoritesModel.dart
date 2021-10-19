import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:wlt3/models/Division.dart';
import 'package:wlt3/models/Game.dart';
import 'package:wlt3/models/League.dart';
import 'package:wlt3/models/Season.dart';
import 'package:wlt3/models/Team.dart';

class FavoritesModel extends ChangeNotifier {
  List<Game> _listGames = [];
  List<Team> _listTeams = [];
  bool _loadingGames = false;
  bool _loadingTeams = false;
  int _selectedIdGames = -1;
  int _selectedIdTeams = -1;
  Game? _selectedModelGames;
  Team? _selectedModelTeams;
  String _filename = 'wlt3fluter';
  String directoryPath = '';

  /// League / season / division
  League? _lastSelectedLeague;
  Season? _lastSelectedSeason;
  Division? _lastSelectedDivision;

  ///
  ///
  ///
  isInGamesFavorite(gamesId) {
    for (Game i in _listGames) {
      if (i.id == gamesId) return true;
    }
    return false;
  }

  ///
  ///
  ///
  isInTeamsFavorite(teamsId) {
    for (Team i in _listTeams) {
      if (i.teamId == teamsId) return true;
    }
    return false;
  }

  ///
  ///  League _lastSelectedLeague;
  ///
  League? get lastSelectedLeague {
    return _lastSelectedLeague;
  }

  set lastSelectedLeague(League? o) {
    _saveGeneric(jsonEncode(o?.toJson()),
        '${this.directoryPath}/${this._filename}_league.json');
    this._lastSelectedLeague = o;
  }

  ///
  ///  Season _lastSelectedSeason;
  ///
  Season? get lastSelectedSeason {
    return _lastSelectedSeason;
  }

  set lastSelectedSeason(Season? o) {
    _saveGeneric(jsonEncode(o?.toJson()),
        '${this.directoryPath}/${this._filename}_season.json');
    this._lastSelectedSeason = o;
  }

  ///
  ///  Division _lastSelectedDivision;
  ///
  Division? get lastSelectedDivision {
    return _lastSelectedDivision;
  }

  set lastSelectedDivision(Division? o) {
    _saveGeneric(jsonEncode(o?.toJson()),
        '${this.directoryPath}/${this._filename}_division.json');
    this._lastSelectedDivision = o;
  }

  ///
  ///
  ///
  List<Game> get listGames {
    int fsrt(Game a, Game b) {
      int? v01 = 0;
      int? v02 = 0;

      v01 = b.dateTimeReal?.millisecondsSinceEpoch;
      v02 = a.dateTimeReal?.millisecondsSinceEpoch;
      if (v01 == null) v01 = 0;
      if (v02 == null) v02 = 0;

      return v01.compareTo(v02);
    }

    _listGames.sort(fsrt);
    return _listGames;
  }

  ///
  ///
  ///
  List<Team> get listTeams {
    return _listTeams;
  }

  ///
  ///
  ///
  int get selectedIdGames {
    return _selectedIdGames;
  }

  ///
  ///
  ///
  int get selectedIdTeams {
    return _selectedIdTeams;
  }

  ///
  ///
  ///
  bool get loadingGames {
    return _loadingGames;
  }

  ///
  ///
  ///
  bool get loadingTeams {
    return _loadingTeams;
  }

  ///
  ///
  ///
  Game? get selectedModelGames {
    return _selectedModelGames;
  }

  ///
  ///
  ///
  Team? get selectedModelTeams {
    return _selectedModelTeams;
  }

  ///
  ///
  ///
  set selectedModelGames(Game? v) {
    _selectedModelGames = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedModelTeams(Team? v) {
    _selectedModelTeams = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedIdGames(int v) {
    _selectedIdGames = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedIdTeams(int v) {
    _selectedIdTeams = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set loadingGames(bool v) {
    _loadingGames = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set loadingTeams(bool v) {
    _loadingTeams = v;
    notifyListeners();
  }

  ///
  ///
  ///
  addToListGames(Game o) {
    _listGames.add(o);
    _saveGames();
    notifyListeners();
  }

  ///
  ///
  ///
  removeFromListGames(Game o) {
    _listGames.removeWhere((Game i) => i.id == o.id);
    _saveGames();
    notifyListeners();
  }

  ///
  ///
  ///
  addToListTeams(Team o) {
    _listTeams.add(o);
    _saveTeams();
    notifyListeners();
  }

  ///
  ///
  ///
  removeFromListTeams(Team o) {
    print('------------------');
    print(o);

    _listTeams.removeWhere((Team i) => i.teamId == o.teamId);
    _saveTeams();
    notifyListeners();
  }

  ///
  ///
  ///
  read() async {
    final directory = await getApplicationDocumentsDirectory();
    this.directoryPath = directory.path;

    try {
      final fileLeague =
          File('${this.directoryPath}/${this._filename}_league.json');
      String jsonLeague = await fileLeague.readAsString();
      Map<String, dynamic> _jsonLeague = jsonDecode(jsonLeague);
      _lastSelectedLeague = League.fromJson(_jsonLeague);
      print("${this.directoryPath}/${this._filename}_league.json processed");
    } catch (e) {
      print(
          "Couldn't read ${this.directoryPath}/${this._filename}_league.json file and process file");
    }

    try {
      final fileSeason =
          File('${this.directoryPath}/${this._filename}_season.json');
      String jsonSeason = await fileSeason.readAsString();
      Map<String, dynamic> _jsonSeason = jsonDecode(jsonSeason);
      _lastSelectedSeason = Season.fromJson(_jsonSeason);
      print("${this.directoryPath}/${this._filename}_season.json saved");
    } catch (e) {
      print(
          "Couldn't read ${this.directoryPath}/${this._filename}_season.json file and process file");
    }

    try {
      final fileDivision =
          File('${this.directoryPath}/${this._filename}_division.json');
      String jsonDivision = await fileDivision.readAsString();
      Map<String, dynamic> _jsonDivision = jsonDecode(jsonDivision);
      _lastSelectedDivision = Division.fromJson(_jsonDivision);
      print("${this.directoryPath}/${this._filename}_division.json saved");
    } catch (e) {
      print(
          "Couldn't read ${this.directoryPath}/${this._filename}_division.json file and process file");
    }

    try {
      final fileGames =
          File('${this.directoryPath}/${this._filename}_games.json');
      String jsonGames = await fileGames.readAsString();
      List _jsonGames = jsonDecode(jsonGames);
      _listGames = _jsonGames.map((e) => Game.fromJson(e)).toList();
      print("${this.directoryPath}/${this._filename}_games.json saved");
    } catch (e) {
      print(
          "Couldn't read ${this.directoryPath}/${this._filename}_games.json file and process file");
    }

    try {
      final fileTeams =
          File('${this.directoryPath}/${this._filename}_teams.json');
      String jsonTeams = await fileTeams.readAsString();
      List _jsonTeams = jsonDecode(jsonTeams);
      _listTeams = _jsonTeams.map((e) => Team.fromJson(e)).toList();
      print("${this.directoryPath}/${this._filename}_teams.json saved");
    } catch (e) {
      print(
          "Couldn't read ${this.directoryPath}/${this._filename}_teams.json file and process file");
    }
  }

  ///
  ///
  ///
  _saveGames() async {
    var json = jsonEncode(_listGames.map((e) => e.toJson()).toList());
    final file = File('${this.directoryPath}/${this._filename}_games.json');
    await file.writeAsString(json);
    print('Games saved');
  }

  ///
  ///
  ///
  _saveTeams() async {
    var json = jsonEncode(_listTeams.map((e) => e.toJson()).toList());
    await this._saveGeneric(
        json, '${this.directoryPath}/${this._filename}_teams.json');
    print('Teams saved');
  }

  ///
  ///
  ///
  _saveGeneric(String json, String filename) async {
    try {
      final file = File(filename);
      await file.writeAsString(json);
    } catch (eee) {
      print('Can not write ' + filename);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Game.dart';

class GamesModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Game> _list = [];
  bool _loading = false;
  int _selectedId = -1;
  Game? _selectedModel;
  DateTime _selectedDate = DateTime.now();

  ///
  ///
  ///
  List<Game> get list {
    return _list;
  }

  ///
  ///
  ///
  int get selectedId {
    return _selectedId;
  }

  ///
  ///
  ///
  bool get loading {
    return _loading;
  }

  ///
  ///
  ///
  Game? get selectedModel {
    return _selectedModel;
  }

  ///
  ///
  ///
  DateTime get selectedDate {
    return _selectedDate;
  }

  ///
  ///
  ///
  set selectedDate(DateTime v) {
    _selectedDate = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedModel(Game? v) {
    _selectedModel = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedId(int v) {
    _selectedId = v;
    notifyListeners();
  }

  ///
  ///
  ///

  set loading(bool v) {
    _loading = v;
    notifyListeners();
  }

  ///
  ///
  ///
  addToList(o) {
    _list.add(o);
    notifyListeners();
  }

  ///
  ///
  ///
  _replaceList(List<Game> o) {
    _list = [];
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int seasonId, int divisionId) async {
    if (seasonId < 0 || divisionId < 0) return null;
    this.loading = true;
    String date = DateFormat("yyyy-MM-dd").format(this._selectedDate);
    _list = [];

    await _api
        .getGames(date, seasonId, divisionId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }

  ///
  ///
  ///
  _whenGotOneGame(Game game) {
    this.selectedModel = game;
    this.loading = false;
  }

  ///
  ///
  ///
  loadOneGameData(int gameId) async {
    if (gameId < 0) return null;
    this._loading = true;
    await _api
        .getGame(gameId)
        .then((dt) => _whenGotOneGame(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}

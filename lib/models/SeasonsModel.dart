import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Season.dart';

class SeasonsModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Season> _list = [];
  bool _loading = false;
  int _selectedId = -1;
  Season? _selectedModel;

  ///
  ///
  ///
  get list {
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
  Season? get selectedModel {
    return _selectedModel;
  }

  ///
  ///
  ///
  set selectedModel(Season? v) {
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
  _replaceList(List<Season> o) {
    _list = [];
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int leagueId) async {
    if (leagueId < 0) return null;
    this.loading = true;
    _list = [];
    await _api
        .getSeasons(leagueId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}

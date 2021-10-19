import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Team.dart';
import 'package:wlt3/models/Teamdata.dart';

class TeamModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Team> _list = [];
  bool _loading = false;
  int _selectedId = -1;
  Teamdata? _selectedModel;

  ///
  ///
  ///
  List<Team> get list {
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
  Teamdata? get selectedModel {
    return _selectedModel;
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
  set selectedId(int v) {
    _selectedId = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedModel(Teamdata? v) {
    _selectedModel = v;
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
  _replaceSelectedModel(Teamdata m) {
    this._selectedModel = m;
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int teamId) async {
    if (teamId < 0) return null;
    this.loading = true;
    await _api
        .getTeamInfoFull(teamId)
        .then((dt) => _replaceSelectedModel(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}

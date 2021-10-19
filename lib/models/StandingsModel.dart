import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Standing.dart';

class StandingsModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Standing> _list = [];
  bool _loading = false;
  int _selectedId = -1;
  Standing? _selectedModel;

  ///
  ///
  ///
  List<Standing> get list {
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
  Standing? get selectedModel {
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
  set selectedModel(Standing? v) {
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
  _replaceList(List<Standing> o) {
    _list = [];
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int divisionId, int tierId) async {
    if (divisionId < 0 || tierId < 0) return null;
    this.loading = true;
    _list = [];
    await _api
        .getTeamstandingLocalTierGroupGenericNormalized(divisionId, tierId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}

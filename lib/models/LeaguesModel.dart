import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/League.dart';

class LeaguesModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<League> _list = [];
  bool _loading = false;
  int _selectedId = -1;
  League? _selectedModel;

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
  League? get selectedModel {
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
  set selectedModel(League? v) {
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
  _replaceList(List<League> o) {
    _list = [];
    o.forEach((f) => _list.add(f));
    this.loading = false;
  }

  ///
  ///
  ///
  loadData() async {
    if (_list.length == 0) {
      this.loading = true;
      await _api
          .getLeagues()
          .then((dt) => _replaceList(dt))
          .catchError((e) => throw Exception(e))
          .whenComplete(() => notifyListeners());
    }
  }
}

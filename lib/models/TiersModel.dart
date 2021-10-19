import 'package:flutter/material.dart';
import 'package:wlt3/libs/ApiaccessWlt.dart';
import 'package:wlt3/models/Tiers.dart';

class TiersModel extends ChangeNotifier {
  ApiaccessWlt _api = new ApiaccessWlt();
  List<Tiers> _list = [];
  bool _loading = false;
  int? _selectedId = -1;
  Tiers? _selectedModel;

  ///
  ///
  ///
  get list {
    return _list;
  }

  ///
  ///
  ///
  int? get selectedId {
    return _selectedId;
  }

  ///
  ///
  ///
  Tiers? get selectedModel {
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
  set selectedId(int? v) {
    _selectedId = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set selectedModel(Tiers? v) {
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
  _replaceList(List<Tiers> o) {
    _list = [];
    o.forEach((f) => _list.add(f));
    try {
      this.selectedModel = this._list.first;
      this.selectedId = this._list.first.id;
    } catch (wew) {}
    this.loading = false;
  }

  ///
  ///
  ///
  loadData(int divisionId) async {
    if (divisionId < 0) return null;
    this.loading = true;
    _list = [];
    await _api
        .getTiers(divisionId)
        .then((dt) => _replaceList(dt))
        .catchError((e) => throw Exception(e))
        .whenComplete(() => notifyListeners());
  }
}

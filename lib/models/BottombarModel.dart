import 'package:flutter/foundation.dart';

class BottombarModel extends ChangeNotifier {
  int _idx = 2;
  int _previousidx = 2;

  ///
  ///
  ///
  int get idx {
    return _idx;
  }

  ///
  ///
  ///
  int get previousidx {
    return _previousidx;
  }

  ///
  ///
  ///
  set idx(v) {
    _previousidx = _idx;
    _idx = v;
    notifyListeners();
  }

  ///
  ///
  ///
  set previousidx(v) {
    _previousidx = v;
    notifyListeners();
  }


}

import 'package:flutter/cupertino.dart';

class NavigatorViewModel extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeScreen(int index) {
    _index = index;

    notifyListeners();
  }
}

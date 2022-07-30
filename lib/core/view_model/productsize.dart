import 'package:flutter/cupertino.dart';

class ProductSize extends ChangeNotifier {
  String size = "";
  String sizecolor = "";

  void itemsize(String index) {
    size = index;
    sizecolor = index;
    notifyListeners();
  }
}

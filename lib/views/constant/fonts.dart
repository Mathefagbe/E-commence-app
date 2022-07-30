//sizes in the app
import 'dart:math';

import 'package:flutter/cupertino.dart';

class Fonts {
  double width(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  double height(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  double textfont(BuildContext context) {
    double textfont = max(
        MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    return textfont;
  }
}

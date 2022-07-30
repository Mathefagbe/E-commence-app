import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/fonts.dart';

class ReusableBotton extends StatelessWidget {
  ReusableBotton(
      {Key? key, required this.ontap, required this.text, required this.margin})
      : super(key: key);
  final Widget text;
  final VoidCallback ontap;
  final EdgeInsetsGeometry margin;
  Fonts fonts = Fonts();
  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);

    return InkWell(
      onTap: ontap,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        height: height * 0.068,
        width: double.maxFinite,
        child: text,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 177, 7),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

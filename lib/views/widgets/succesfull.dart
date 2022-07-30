import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shopex/views/constant/fonts.dart';

import 'package:shopex/views/screens/order.dart';
import 'package:shopex/views/widgets/reuseablebotton.dart';

class SuccessAlert extends StatelessWidget {
  Fonts fonts = Fonts();
  @override
  Widget build(BuildContext context) {
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    var height = fonts.height(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: width * 0.014),
        height: height * 0.463,
        child: Column(
          children: [
            ClipPath(
              clipper: Customclipper(),
              child: Container(
                height: height * 0.163,
                width: double.maxFinite,
                child: const Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: Colors.white,
                ),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 64, 0, 75),
                  Colors.purpleAccent
                ])),
              ),
            ),
            Text(
              "Successful",
              style: TextStyle(
                  fontSize: textfont * 0.027, fontWeight: FontWeight.bold),
            ),
            Text(
              "You have successfully placed",
              style: TextStyle(
                  fontSize: textfont * 0.020, fontWeight: FontWeight.w400),
            ),
            Text(
              "your order",
              style: TextStyle(
                  fontSize: textfont * 0.020, fontWeight: FontWeight.w400),
            ),
            ReusableBotton(
              ontap: () {
                Navigator.pop(context);
              },
              text: Text(
                "continue shopping",
                style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: textfont * 0.025,
                    fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(
                  left: width * 0.056,
                  right: width * 0.056,
                  top: height * 0.027),
            ),
            SizedBox(
              height: height * 0.014,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Orders()));
                },
                child: const Text("Go to order"))
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class Customclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width / 40, 0.0);
    var control1 = Offset(size.width / 5, size.height);
    var end1 = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(control1.dx, control1.dy, end1.dx, end1.dy);
    var control2 = Offset(size.width / 1.3, size.height);
    var end2 = Offset(size.width - (size.width / 40), 0.0);
    path.quadraticBezierTo(control2.dx, control2.dy, end2.dx, end2.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

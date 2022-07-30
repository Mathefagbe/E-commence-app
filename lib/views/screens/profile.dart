// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shopex/views/constant/fonts.dart';
import 'package:shopex/views/screens/order.dart';
import 'package:shopex/views/widgets/profilecard.dart';
import 'package:shopex/views/widgets/reuseablebotton.dart';

import '../../core/view_model/imagepicker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  //final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildtopbar(context),
        _buildList(context),
      ],
    );
  }
}

final Fonts fonts = Fonts();
Widget _buildtopbar(BuildContext context) {
  var height = fonts.height(context);
  var width = fonts.width(context);
  var textfont = fonts.textfont(context);
  var imagepicked = Provider.of<Images>(context).fileimage;
  return Container(
    padding: EdgeInsets.only(top: height * 0.048, left: width * 0.056),
    decoration: const BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
    ),
    height: height * 0.204,
    width: double.maxFinite,
    child: Row(
      children: [
        SizedBox(
          height: height * 0.099,
          width: width * 0.222,
          child: Stack(children: [
            imagepicked == null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                  )
                : CircleAvatar(
                    radius: 35, backgroundImage: FileImage(imagepicked)),
            Positioned(
              left: width * 0.1167,
              top: height * 0.0613,
              child: InkWell(
                onTap: () {
                  Provider.of<Images>(context, listen: false).pickedImage();
                },
                child: Container(
                  height: height * 0.041,
                  width: width * 0.125,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(Icons.camera_alt_sharp, size: 24),
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          width: width * 0.028,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fagbemi Ayomide",
              style: GoogleFonts.sora(
                  fontSize: textfont * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "fagbemi65@gmail.com",
              style: GoogleFonts.sora(
                  fontSize: textfont * 0.02,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _buildList(BuildContext context) {
  return Expanded(
    child: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(15),
      children: [
        ProfileCard(icon: Icons.location_on, text: "Delivery Address"),
        ProfileCard(
            icon: Icons.shopping_bag,
            text: "Order",
            ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Orders()));
            }),
        ProfileCard(icon: Icons.settings, text: "Settings"),
        ProfileCard(icon: Icons.logout, text: "Logout"),
      ],
    ),
  );
}

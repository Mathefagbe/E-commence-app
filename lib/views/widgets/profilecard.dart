import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopex/views/constant/fonts.dart';

class ProfileCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? ontap;
  ProfileCard({Key? key, required this.icon, required this.text, this.ontap})
      : super(key: key);

  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return InkWell(
      onTap: ontap,
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.028),
          height: height * 0.082,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: width * 0.042,
              ),
              Text(
                text,
                style: GoogleFonts.sora(
                  fontSize: textfont * 0.025,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

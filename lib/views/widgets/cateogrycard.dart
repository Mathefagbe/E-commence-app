import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopex/views/constant/fonts.dart';
import 'package:shopex/views/widgets/networkimage.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {Key? key,
      required this.images,
      required this.rating,
      required this.price,
      required this.productname})
      : super(key: key);
  final String images;
  final int rating;
  final String productname;
  final String price;

  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    var textfont = fonts.textfont(context);
    return SizedBox(
      height: height * 0.204,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: images,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: CustomNetworkImage(
                  height: height * 0.191,
                  imageurl: images,
                  radius: 15,
                  width: double.maxFinite),
            ),
          ),
          Wrap(
            children: List.generate(
                5,
                (ind) => rating >= ind
                    ? const Icon(
                        Icons.star,
                        size: 13,
                        color: Color.fromARGB(255, 253, 157, 23),
                      )
                    : const Icon(
                        Icons.star,
                        size: 13,
                        color: Colors.grey,
                      )),
          ),
          Container(
            height: height * 0.054,
            padding: const EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productname,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.020, fontWeight: FontWeight.w400),
                ),
                Text(price,
                    style: TextStyle(
                        fontSize: textfont * 0.020,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

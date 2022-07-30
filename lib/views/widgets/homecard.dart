import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopex/views/constant/fonts.dart';
import 'package:shopex/views/widgets/networkimage.dart';

class HomeCard extends StatelessWidget {
  final String productname;
  final String oldprice;
  final String price;
  final int rating;
  final String discount;
  final String imageurl;
  HomeCard(
      {Key? key,
      required this.discount,
      required this.imageurl,
      required this.oldprice,
      required this.price,
      required this.productname,
      required this.rating})
      : super(key: key);

  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    var textfont = fonts.textfont(context);
    var width = fonts.width(context);
    return SizedBox(
      width: width * 0.417,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: CustomNetworkImage(
                height: height * 0.191,
                imageurl: imageurl,
                radius: 10,
                width: width * 0.417,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: height * 0.027,
              width: width * 0.139,
              child: Text(
                discount,
                style: const TextStyle(color: Colors.white),
              ),
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10))),
            )
          ]),
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
            height: height * 0.14,
            padding: const EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productname,
                  softWrap: true,
                  maxLines: 3,
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.020, fontWeight: FontWeight.w400),
                ),
                Text(price,
                    style: TextStyle(
                        fontSize: textfont * 0.020,
                        fontWeight: FontWeight.bold)),
                Text(oldprice,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: textfont * 0.020,
                        fontWeight: FontWeight.w300)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

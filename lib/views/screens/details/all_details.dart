// ignore_for_file: unnecessary_const, non_constant_identifier_names

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/view_model/addtocart.dart';

import 'package:shopex/core/view_model/productsize.dart';
import 'package:shopex/views/widgets/reuseablebotton.dart';
import '../../constant/fonts.dart';

class Details extends StatelessWidget {
  final String ProductName;
  final String Imageurl;
  final String Description;
  final int Rating;
  final String Price;
  final List<dynamic> Size;
  Details(
      {required this.Description,
      required this.Imageurl,
      required this.Price,
      required this.ProductName,
      required this.Rating,
      required this.Size});

  int item = 0;

  Fonts fonts = Fonts();
  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    return Scaffold(
      body: Column(
        children: [
          _buildTop(context),
          SizedBox(
            height: height * 0.0068,
          ),
          _detailsImage(context),
          _buildItem(context),
          _buildAddCart(context),
        ],
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    var len = Provider.of<AddToCart>(context).cartlength;
    var height = fonts.height(context);
    var width = fonts.width(context);
    return AppBar(
      backgroundColor: Colors.deepPurple,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.deepPurple),
      actions: [
        Badge(
          position: BadgePosition.topEnd(top: -(height * 0.004)),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          badgeContent: Text("$len"),
          badgeColor: Colors.white,
        ),
        SizedBox(
          width: width * 0.056,
        )
      ],
    );
  }

  Widget _detailsImage(BuildContext context) {
    var height = fonts.height(context);

    return Hero(
      tag: Imageurl,
      child: SizedBox(
          height: height * 0.341,
          width: double.maxFinite,
          child: CachedNetworkImage(
            imageUrl: Imageurl,
          )),
    );
  }

  Widget _buildItem(BuildContext context) {
    var sizecolor = Provider.of<ProductSize>(context).sizecolor;
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.028),
        children: [
          SizedBox(
            height: height * 0.0068,
          ),
          Text(
            ProductName,
            style: GoogleFonts.andadaPro(
                fontSize: textfont * 0.027, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.0068,
          ),
          Row(
            children: [
              Text(
                "Rating",
                style: GoogleFonts.roboto(
                    fontSize: textfont * 0.0231, fontWeight: FontWeight.w400),
              ),
              Wrap(
                children: List.generate(
                    5,
                    (index) => Rating >= index
                        ? const Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 255, 141, 1),
                          )
                        : const Icon(
                            Icons.star,
                            color: Colors.grey,
                          )),
              ),
              const Spacer(),
              Text(
                Price.split("-").last,
                style: TextStyle(
                    fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            height: height * 0.0068,
          ),
          Text("Product Details",
              style: GoogleFonts.sora(
                  fontWeight: FontWeight.bold, fontSize: textfont * 0.031)),
          SizedBox(
            height: height * 0.0068,
          ),
          Text(Description,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                  fontSize: textfont * 0.0232, fontWeight: FontWeight.w400)),
          SizedBox(
            height: height * 0.0068,
          ),
          Text(
            "Size",
            style: GoogleFonts.sora(
                fontSize: textfont * 0.027, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width * 0.0222,
          ),
          Wrap(
            spacing: width * 0.056,
            children: List.generate(
                Size.length,
                (index) => InkWell(
                      onTap: () {
                        Provider.of<ProductSize>(context, listen: false)
                            .itemsize(Size[index]);
                      },
                      child: Container(
                        height: height * 0.041,
                        width: width * 0.1111,
                        child: Center(child: Text(Size[index])),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Size[index] == sizecolor
                                    ? Colors.red
                                    : Colors.black,
                                width: width * 0.0042),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCart(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    var itemsize = Provider.of<ProductSize>(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.0136),
      child: ReusableBotton(
          ontap: () {
            Provider.of<AddToCart>(context, listen: false)
                .addCart(Imageurl, Price, ProductName, itemsize, item);
          },
          text: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart),
              Text(
                "Add to Cart",
                style: TextStyle(fontSize: textfont * 0.027),
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: width * 0.222)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopex/core/models/order.dart';
import 'package:shopex/views/constant/fonts.dart';

class OrderBottomSheet extends StatelessWidget {
  OrderBottomSheet({Key? key, required this.index, required this.orders})
      : super(key: key);
  final int index;
  final List<Ordermodel> orders;
  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    var textfont = fonts.textfont(context);
    return SizedBox(
      height: height * 0.354,
      width: double.maxFinite,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel)),
          ),
          Text("Product Name:",
              style: GoogleFonts.andadaPro(
                fontSize: textfont * 0.027,
                fontWeight: FontWeight.w400,
              )),
          Text(orders[index].name,
              style: GoogleFonts.andadaPro(
                fontSize: textfont * 0.034,
                fontWeight: FontWeight.w400,
              )),
          Text("Price:",
              style: GoogleFonts.andadaPro(
                fontSize: textfont * 0.027,
                fontWeight: FontWeight.w400,
              )),
          Text(" ₦ ${orders[index].amount}",
              style: GoogleFonts.andadaPro(
                fontSize: textfont * 0.034,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}

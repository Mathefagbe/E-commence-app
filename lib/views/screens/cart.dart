import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/models/cartproduct.dart';
import 'package:shopex/core/services/firestore/orders.dart';
import 'package:shopex/views/widgets/networkimage.dart';
import 'package:shopex/views/widgets/reuseablebotton.dart';
import 'package:shopex/views/widgets/succesfull.dart';

import '../../core/services/firestore/placedorder.dart';
import '../../core/view_model/addtocart.dart';
import '../constant/fonts.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Fonts fonts = Fonts();
  final PlaceOrder _order = PlaceOrder();
  ValueNotifier<bool> isloading = ValueNotifier(false);
  @override
  void dispose() {
    isloading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return cart.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/shopcart.png",
                  height: height * 0.14,
                  width: width * 0.28,
                ),
                Text(
                  "Your Cart Is Empty",
                  style: GoogleFonts.sora(
                    fontSize: textfont * 0.027,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        : Column(
            children: [
              AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text("Cart"),
                titleTextStyle: GoogleFonts.sora(
                    fontSize: textfont * 0.027,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                centerTitle: true,
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarColor: Colors.deepPurple),
              ),
              _buildCartdeails(context),
              _buildPrice(),
              _buildBuyNow()
            ],
          );
  }

  Widget _buildCartdeails(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.028),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: cart.length,
          separatorBuilder: (context, index) => SizedBox(
            height: height * 0.014,
          ),
          itemBuilder: (context, index) => Slidable(
            endActionPane: ActionPane(children: [
              SlidableAction(
                onPressed: (context) async {
                  await AddToCart().removecart(cart[index].id).then((value) {});
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ], motion: const ScrollMotion()),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  SizedBox(
                      height: height * 0.163,
                      width: width * 0.361,
                      child: CustomNetworkImage(
                          height: height * 0.163,
                          imageurl: cart[index].Imageurl,
                          radius: 10,
                          width: width * 0.361)),
                  SizedBox(
                    width: width * 0.0139,
                  ),
                  SizedBox(
                    width: width * 0.417,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cart[index].ProductName,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.andadaPro(
                                fontSize: textfont * 0.019,
                                fontWeight: FontWeight.bold)),
                        Text("Size:${cart[index].size}",
                            style: GoogleFonts.andadaPro(
                                fontSize: textfont * 0.02,
                                fontWeight: FontWeight.bold)),
                        Text(cart[index].Price,
                            style: GoogleFonts.andadaPro(
                                fontSize: textfont * 0.02,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.069,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              cart[index].item++;
                              AddToCart().update(
                                  cart[index].id,
                                  cart[index].Imageurl,
                                  cart[index].Price,
                                  cart[index].ProductName,
                                  cart[index].size,
                                  cart[index].item);
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            size: 30,
                          ),
                        ),
                        Text(
                          "${cart[index].item}",
                        ),
                        IconButton(
                          onPressed: () {
                            if (cart[index].item >= 1) {
                              setState(() {
                                cart[index].item--;
                                AddToCart().update(
                                    cart[index].id,
                                    cart[index].Imageurl,
                                    cart[index].Price,
                                    cart[index].ProductName,
                                    cart[index].size,
                                    cart[index].item);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrice() {
    var fees = Provider.of<AddToCart>(context);
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.028, right: width * 0.028, bottom: height * 0.0068),
      child: SizedBox(
        height: height * 0.136,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${cart.length} items",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                ),
                Text(
                  "₦ ${fees.totalprice}",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery fee",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                ),
                Text(
                  "₦ ${fees.deliveryfee.roundToDouble()}",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                ),
                Text(
                  "₦ ${fees.totalfee}",
                  style: GoogleFonts.andadaPro(
                      fontSize: textfont * 0.027, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBuyNow() {
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return ReusableBotton(
      ontap: () async {
        isloading.value = true;
        await Future.delayed(const Duration(seconds: 4));
        _order.place();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return SuccessAlert();
            });
        isloading.value = false;
      },
      text: ValueListenableBuilder(
        valueListenable: isloading,
        builder: (context, bool value, child) => value
            ? const Center(child: CircularProgressIndicator())
            : Text(
                "Place Order",
                style: GoogleFonts.manrope(
                    color: Colors.white,
                    fontSize: textfont * 0.025,
                    fontWeight: FontWeight.bold),
              ),
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.1111),
    );
  }
}

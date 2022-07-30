import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/helper/databasehelper.dart';
import 'package:shopex/core/models/topdeals.dart';

import 'package:shopex/views/widgets/homecard.dart';
import 'package:shopex/views/widgets/customslider.dart';

import '../../core/models/cartproduct.dart';
import '../../core/models/flashDeal.dart';
import '../../core/view_model/addtocart.dart';
import '../constant/fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);

    return Column(
      children: [
        _buildTop(context),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const CustomSlider(),
              SizedBox(height: height * 0.0068),
              _latestSales(context),
              SizedBox(height: height * 0.0068),
              _suits(context),
            ],
          ),
        ),
      ],
    );
  }

//
  Widget _buildTop(BuildContext context) {
    var textfont = fonts.textfont(context);
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text("My Shop"),
      titleTextStyle: GoogleFonts.sora(
          fontSize: textfont * 0.027,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.deepPurple),
    );
  }

//
  Widget _latestSales(BuildContext context) {
    var value = Provider.of<List<FlashDealModel>?>(context);
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.028),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Flash Deals",
            style: TextStyle(fontSize: textfont * 0.025),
          ),
          SizedBox(
            height: height * 0.0068,
          ),
          SizedBox(
            height: height * 0.37,
            width: double.maxFinite,
            child: value == null
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Color.fromARGB(255, 255, 119, 0),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCard(
                          discount: value[index].discount,
                          imageurl: value[index].imageurl,
                          oldprice: value[index].oldprice,
                          price: value[index].price,
                          productname: value[index].productname,
                          rating: value[index].rating);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.028,
                      );
                    },
                    itemCount: value.length),
          )
        ],
      ),
    );
  }

  Widget _suits(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    var topdeal = Provider.of<List<TopDealModel>?>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.028),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Deals",
            style: TextStyle(fontSize: textfont * 0.025),
          ),
          SizedBox(
            height: height * 0.006,
          ),
          SizedBox(
            height: height * 0.37,
            width: double.maxFinite,
            child: topdeal == null
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Color.fromARGB(255, 255, 119, 0),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HomeCard(
                          discount: topdeal[index].discount,
                          imageurl: topdeal[index].imageurl,
                          oldprice: topdeal[index].oldprice,
                          price: topdeal[index].price,
                          productname: topdeal[index].productname,
                          rating: topdeal[index].rating);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.028,
                      );
                    },
                    itemCount: topdeal.length),
          )
        ],
      ),
    );
  }
}

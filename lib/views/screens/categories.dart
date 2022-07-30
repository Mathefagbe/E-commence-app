import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/models/cloths.dart';
import 'package:shopex/core/models/products.dart';
import 'package:shopex/core/models/shoe.dart';
import 'package:shopex/views/constant/fonts.dart';

import 'package:shopex/views/screens/details/all_details.dart';
import 'package:shopex/views/widgets/cateogrycard.dart';

import 'package:shopex/views/widgets/customdecoration.dart';

import '../../core/models/sneakers.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  final Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          _buildTop(context),
          _buildTabar(context),
          SizedBox(
            height: height * 0.014,
          ),
          _buildTabviews(context),
        ],
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    var textfont = fonts.textfont(context);
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text("Categories"),
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

  Widget _buildTabar(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.028),
      child: SizedBox(
        height: height * 0.068,
        width: double.maxFinite,
        child: const TabBar(
            isScrollable: false,
            //unselectedLabelColor: Colors.black38,
            indicator: CustomDecoration(
                color: Color.fromARGB(255, 160, 6, 187), radius: 5),
            labelColor: Color.fromARGB(255, 160, 6, 187),
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Cloths",
              ),
              Tab(
                text: "Shoes",
              ),
              Tab(
                text: "Sneakers",
              ),
            ]),
      ),
    );
  }

  Widget _buildAll(BuildContext context) {
    return Consumer<List<AllProducts>?>(builder: (context, value, child) {
      var items = value;
      return items == null
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Color.fromARGB(255, 255, 119, 0),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  Description: items[index].Description,
                                  Imageurl: items[index].Imageurl,
                                  Price: items[index].Price,
                                  ProductName: items[index].ProductName,
                                  Rating: items[index].Rating,
                                  Size: items[index].Size,
                                )));
                  },
                  child: CategoryCard(
                      images: items[index].Imageurl,
                      rating: items[index].Rating,
                      price: items[index].Price,
                      productname: items[index].ProductName)),
            );
    });
  }

  Widget _buildCloth(context) {
    var cloth = Provider.of<List<ClothProducts>?>(context);
    return cloth == null
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Color.fromARGB(255, 255, 119, 0),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: cloth.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 6),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                Description: cloth[index].Description,
                                Imageurl: cloth[index].Imageurl,
                                Price: cloth[index].Price,
                                ProductName: cloth[index].ProductName,
                                Rating: cloth[index].Rating,
                                Size: cloth[index].Size,
                              )));
                },
                child: CategoryCard(
                    images: cloth[index].Imageurl,
                    rating: cloth[index].Rating,
                    price: cloth[index].Price,
                    productname: cloth[index].ProductName)),
          );
  }

  Widget _buildShoes(context) {
    var shoe = Provider.of<List<ShoeProduct>?>(context);
    return shoe == null
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Color.fromARGB(255, 255, 119, 0),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: shoe.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 6),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                Description: shoe[index].Description,
                                Imageurl: shoe[index].Imageurl,
                                Price: shoe[index].Price,
                                ProductName: shoe[index].ProductName,
                                Rating: shoe[index].Rating,
                                Size: shoe[index].Size,
                              )));
                },
                child: CategoryCard(
                    images: shoe[index].Imageurl,
                    rating: shoe[index].Rating,
                    price: shoe[index].Price,
                    productname: shoe[index].ProductName)),
          );
  }

  Widget _buildSneakers(BuildContext context) {
    var sneaker = Provider.of<List<SneakersProducts>?>(context);
    return sneaker == null
        ? const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Color.fromARGB(255, 255, 119, 0),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: sneaker.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 6),
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                Description: sneaker[index].Description,
                                Imageurl: sneaker[index].Imageurl,
                                Price: sneaker[index].Price,
                                ProductName: sneaker[index].ProductName,
                                Rating: sneaker[index].Rating,
                                Size: sneaker[index].Size,
                              )));
                },
                child: CategoryCard(
                    images: sneaker[index].Imageurl,
                    rating: sneaker[index].Rating,
                    price: sneaker[index].Price,
                    productname: sneaker[index].ProductName)),
          );
  }

  Widget _buildTabviews(BuildContext context) {
    var width = fonts.width(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.028),
        child: TabBarView(children: [
          _buildAll(context),
          _buildCloth(context),
          _buildShoes(context),
          _buildSneakers(context)
        ]),
      ),
    );
  }
}

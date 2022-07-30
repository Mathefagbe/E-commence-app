import 'package:flutter/cupertino.dart';
import 'package:shopex/core/helper/databasehelper.dart';

// import 'package:shopex/core/ints.dart';

import 'package:shopex/core/models/cartproduct.dart';

class AddToCart extends ChangeNotifier {
  double totalprice = 0;
  double deliveryfee = 0;
  double totalfee = 0;
  int _cartlength = 0;
  int get cartlength => _cartlength;
  //add to your cart list
  void addCart(String url, String price, String name, String size, int item) {
    //converting the price to integer
    int itemPrice = (int.parse(price
        .split("-")
        .last
        .replaceAll(RegExp(r","), "")
        .replaceAll(RegExp(r"₦"), "")));

    int totalamount = itemPrice * item;

    var carting = CartProduct(
        Imageurl: url,
        Price: price,
        ProductName: name,
        size: size,
        item: item,
        totalamount: totalamount);

    if (cart.isEmpty) {
      DataBaseService.data.insert(carting);
    } else if (cart
        .any((element) => element.ProductName.contains(carting.ProductName))) {
    } else {
      DataBaseService.data.insert(carting);
    }
  }

//read from your data base and also your price
  void readcart() async {
    DataBaseService.data.read().then((value) {
      cart = value;
      _cartlength = value.length;
      prices = value.map((e) => e.totalamount).toList();
      totalprice = prices.fold(0, (value, element) => value + element);
      deliveryfee = totalprice * 0.02;
      totalfee = totalprice + deliveryfee;
      notifyListeners();
    });
  }

//remove from your data base
  Future<void> removecart(int? id) async {
    await DataBaseService.data.remove(id);
  }

//update your data base
  Future<void> update(
    int? id,
    String url,
    String price,
    String name,
    String size,
    int item,
  ) async {
    //convert the price to string before update.
    int itemPrice = (int.parse(price
        .split("-")
        .last
        .replaceAll(RegExp(r","), "")
        .replaceAll(RegExp(r"₦"), "")));
    int totalamount = itemPrice * item;
    var carting = CartProduct(
        Imageurl: url,
        Price: price,
        ProductName: name,
        size: size,
        item: item,
        id: id,
        totalamount: totalamount);
    await DataBaseService.data.update(carting);
  }
}

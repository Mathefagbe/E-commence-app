import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/models/cartproduct.dart';
import 'package:shopex/core/view_model/addtocart.dart';

class PlaceOrder {
  final firstore = FirebaseFirestore.instance.collection("order");

  void place() async {
    //logic used to generate the orderid

    cart.map((e) {
      var r = Random();
      const _chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      var alphabet =
          List.generate(10, (index) => _chars[r.nextInt(_chars.length)]).join();

      var rand = 100 + r.nextInt(1000);
      var id = alphabet + rand.toString();
      var codeid = id.split("");
      codeid.shuffle();
      String orderid = codeid.join();
      return placeorder(
          e.ProductName, e.size, e.item, e.Price, Timestamp.now(), orderid);
    }).toList();
  }

  Future<void> placeorder(String productname, String productsize, int quantity,
      String price, Timestamp timestamp, String orderid) async {
    //logic used to convert the priceto int

    int itemPrice = (int.parse(price
        .split("-")
        .last
        .replaceAll(RegExp(r","), "")
        .replaceAll(RegExp(r"₦"), "")));
    await firstore.doc(orderid).set({
      "productname": productname,
      "productsize": productsize,
      "quantity": quantity,
      "date": timestamp,
      "price": itemPrice,
      "orderid": orderid,
      "status": "Pending",
    });
  }
}

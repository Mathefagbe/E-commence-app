import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopex/core/models/order.dart';

class OrderService {
  final firstore = FirebaseFirestore.instance.collection("order");

  List<Ordermodel> ordered(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => Ordermodel(
            amount: doc["price"],
            date: doc["date"],
            id: doc["orderid"],
            name: doc["productname"],
            quantity: doc["quantity"],
            size: doc["productsize"],
            status: doc["status"]))
        .toList();
  }

  Future<List<Ordermodel>> get allorder async {
    var orders = await firstore
        .orderBy("date", descending: true)
        .get()
        .then((value) => ordered(value));
    return orders;
  }

  Future<void> order(String orderid) async {
    await firstore.doc(orderid).delete();
  }
}

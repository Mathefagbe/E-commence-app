import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/products.dart';

class AllCategory {
  final firstore = FirebaseFirestore.instance.collection("categories");

  List<AllProducts> product(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => AllProducts(
            Description: doc["Description"],
            Imageurl: doc["Imageurl"],
            Price: doc["Price"],
            ProductName: doc["ProductName"],
            Rating: doc["Rating"],
            Size: doc["Size"]))
        .toList();
  }

  Future<List<AllProducts>> allItem() {
    return firstore
        .doc("all")
        .collection("all-categories")
        .get()
        .then((value) => product(value));
  }
}

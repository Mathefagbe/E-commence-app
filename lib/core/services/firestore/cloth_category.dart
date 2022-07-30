import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/cloths.dart';

class ClothCategory {
  final firstore = FirebaseFirestore.instance.collection("categories");

  List<ClothProducts> product(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => ClothProducts(
            Description: doc["Description"],
            Imageurl: doc["Imageurl"],
            Price: doc["Price"],
            ProductName: doc["ProductName"],
            Rating: doc["Rating"],
            Size: doc["Size"]))
        .toList();
  }

  Future<List<ClothProducts>> clothitem() {
    return firstore
        .doc("cloths")
        .collection("cloths")
        .get()
        .then((value) => product(value));

    // .map((event) => product(event));
  }
}

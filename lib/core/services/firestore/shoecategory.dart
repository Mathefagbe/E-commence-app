import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/shoe.dart';

class ShoeCategory {
  final firstore = FirebaseFirestore.instance.collection("categories");

  List<ShoeProduct> product(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => ShoeProduct(
            Description: doc["Description"],
            Imageurl: doc["Imageurl"],
            Price: doc["Price"],
            ProductName: doc["ProductName"],
            Rating: doc["Rating"],
            Size: doc["Size"]))
        .toList();
  }

  Future<List<ShoeProduct>> shoeitem() {
    return firstore
        .doc("shoes")
        .collection("shoes")
        .get()
        .then((value) => product(value));
  }
}

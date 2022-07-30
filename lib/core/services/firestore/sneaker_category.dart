import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/sneakers.dart';

class SneakersCategory {
  final firstore = FirebaseFirestore.instance.collection("categories");

  List<SneakersProducts> product(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => SneakersProducts(
            Description: doc["Description"],
            Imageurl: doc["Imageurl"],
            Price: doc["Price"],
            ProductName: doc["ProductName"],
            Rating: doc["Rating"],
            Size: doc["Size"]))
        .toList();
  }

  Future<List<SneakersProducts>> allItem() {
    return firstore
        .doc("sneakers")
        .collection("sneakers")
        .get()
        .then((value) => product(value));
  }
}

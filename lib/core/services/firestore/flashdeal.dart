import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/flashDeal.dart';

class FlashDealService {
  final firstore = FirebaseFirestore.instance.collection("Advert");

  List<FlashDealModel> ordered(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => FlashDealModel(
            imageurl: doc["Imageurl"],
            discount: doc["Discount"],
            price: doc["Price"],
            productname: doc["Productname"],
            rating: doc["Rating"],
            oldprice: doc["Oldprice"]))
        .toList();
  }

  Future<List<FlashDealModel>> flash() {
    return firstore
        .doc("flash deal")
        .collection("flash deal")
        .get()
        .then((value) => ordered(value));
  }
}

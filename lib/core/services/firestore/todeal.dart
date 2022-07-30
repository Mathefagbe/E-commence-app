import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/flashDeal.dart';
import 'package:shopex/core/models/topdeals.dart';

class TopDealService {
  final firstore = FirebaseFirestore.instance.collection("Advert");

  List<TopDealModel> ordered(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => TopDealModel(
            imageurl: doc["Imageurl"],
            discount: doc["Discount"],
            price: doc["Price"],
            productname: doc["Productname"],
            rating: doc["Rating"],
            oldprice: doc["Oldprice"]))
        .toList();
  }

  Future<List<TopDealModel>> topdeal() {
    return firstore
        .doc("TopDeal")
        .collection("TopDeal")
        .get()
        .then((value) => ordered(value));
  }
}

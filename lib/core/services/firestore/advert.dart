import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopex/core/models/advert.dart';

class Advertservice {
  final firstore = FirebaseFirestore.instance.collection("Advert");

  List<Advert> product(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((doc) => Advert(Imageurl: doc["Imageurl"]))
        .toList();
  }

  Future<List<Advert>> get advert {
    return firstore
        .doc("Adverts")
        .collection("Adverts")
        .get()
        .then((value) => product(value));
    // .map((event) => product(event));
  }
}

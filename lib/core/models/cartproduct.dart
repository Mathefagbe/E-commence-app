// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class CartProduct {
  int? id;
  final String ProductName;
  final String Imageurl;
  int item;
  final String Price;
  final String size;
  final int totalamount;

  CartProduct(
      {this.id,
      required this.Imageurl,
      required this.Price,
      required this.ProductName,
      required this.size,
      required this.item,
      required this.totalamount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'ProductName': ProductName,
      'Imageurl': Imageurl,
      'item': item,
      'Price': Price,
      'size': size,
      "totalamount": totalamount,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      id: map["id"],
      ProductName: map['ProductName'],
      Imageurl: map['Imageurl'],
      item: map['item'] as int,
      Price: map['Price'] as String,
      size: map['size'] ?? "",
      totalamount: map["totalamount"],
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduct.fromJson(String source) =>
      CartProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}

//list that add to cart to be shown on the cart screen
List<CartProduct> cart = [];

//list that help to get the total price
List<int> prices = [];

//List<CartProduct> carted = [];

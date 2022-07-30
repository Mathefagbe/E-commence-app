import 'package:cloud_firestore/cloud_firestore.dart';

class Ordermodel {
  final String name;
  final int amount;
  final String size;
  final Timestamp date;
  final String id;
  final int quantity;
  final String status;

  Ordermodel(
      {required this.amount,
      required this.date,
      required this.id,
      required this.name,
      required this.size,
      required this.quantity,
      required this.status});
}

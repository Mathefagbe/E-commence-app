class PaymentMethod {
  final String method;
  bool checker = false;
  PaymentMethod({required this.method});
}

List<PaymentMethod> payment = [
  PaymentMethod(method: "Pay On Delivery"),
  PaymentMethod(method: "Pay With Card")
];

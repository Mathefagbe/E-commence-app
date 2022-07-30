class TopDealModel {
  final String productname;
  final String imageurl;
  final String discount;
  final String price;
  final int rating;
  final String oldprice;
  const TopDealModel(
      {required this.imageurl,
      required this.discount,
      required this.price,
      required this.productname,
      required this.rating,
      required this.oldprice});
}

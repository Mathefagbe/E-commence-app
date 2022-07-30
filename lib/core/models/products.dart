// ignore_for_file: non_constant_identifier_names

//all product category
class AllProducts {
  final String ProductName;
  final String Imageurl;
  final String Description;
  final int Rating;
  final String Price;
  final List<dynamic> Size;

  AllProducts({
    required this.ProductName,
    required this.Imageurl,
    required this.Price,
    required this.Description,
    required this.Rating,
    required this.Size,
  });
}

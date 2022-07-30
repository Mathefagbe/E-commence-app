import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {required this.height,
      required this.imageurl,
      required this.radius,
      required this.width});
  final String imageurl;
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: const Duration(seconds: 0),
      fadeOutDuration: const Duration(seconds: 0),
      imageUrl: imageurl,
      imageBuilder: (context, imageProvider) => Container(
        padding: const EdgeInsets.all(20),
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

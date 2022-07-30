// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:shopex/views/constant/fonts.dart';

// class Shimmerloader1 extends StatelessWidget {
//   Shimmerloader1({Key? key}) : super(key: key);
//   Fonts fonts = Fonts();
//   @override
//   Widget build(BuildContext context) {
//     var height = fonts.height(context);
//     var textfont = fonts.textfont(context);
//     var width = fonts.width(context);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(children: [
//           Container(
//               height: height * 0.191,
//               width: width * 0.417,
//               decoration: const BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(10),
//                       topRight: Radius.circular(10)))),
//           Container(
//             alignment: Alignment.center,
//             height: height * 0.027,
//             width: width * 0.139,
//             decoration: const BoxDecoration(
//                 color: Colors.red,
//                 borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(10),
//                     topRight: Radius.circular(10))),
//           )
//         ]),
//         Wrap(
//           children: List.generate(
//               5,
//               (ind) => const Icon(
//                     Icons.star,
//                     size: 13,
//                     color: Colors.grey,
//                   )),
//         ),
//         Container(
//           height: height * 0.14,
//           padding: const EdgeInsets.only(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   height: 10,
//                   width: width * 0.139,
//                   decoration: const BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(10),
//                           topRight: Radius.circular(10)))),
//               Container(
//                   height: 10,
//                   width: width * 0.139,
//                   decoration: const BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(10),
//                           topRight: Radius.circular(10))))
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Shimmerloader2 extends StatelessWidget {
//   Shimmerloader2({Key? key}) : super(key: key);
//   Fonts fonts = Fonts();
//   @override
//   Widget build(BuildContext context) {
//     var height = fonts.height(context);
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade400,
//       highlightColor: Colors.grey.shade500,
//       direction: ShimmerDirection.ltr,
//       loop: 10,
//       enabled: true,
//       //period: const Duration(seconds: 3),
//       child: Container(
//         height: height * 0.177,
//         width: double.maxFinite,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.black54,
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }

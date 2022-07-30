import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/models/advert.dart';

import 'package:shopex/views/constant/fonts.dart';
import 'package:shopex/views/widgets/networkimage.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  // late AnimationController _animationController;
  // late Animation causoralanimation;
  int start = 0;
  List<Advert>? advertdetails;
  final Fonts fonts = Fonts();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    advertdetails = Provider.of<List<Advert>?>(context);
    //check();
  }

  // void check() {
  //   if (advertdetails != null) {
  //     _animationController = AnimationController(
  //       vsync: this,
  //       duration: const Duration(seconds: 30),
  //       animationBehavior: AnimationBehavior.preserve,
  //     );
  //     causoralanimation = IntTween(begin: 0, end: advertdetails!.length - 1)
  //         .animate(_animationController)
  //       ..addListener(() {
  //         setState(() {
  //           if (mounted) {
  //             start = causoralanimation.value;
  //           }
  //         });
  //       });
  //     _animationController.forward();
  //     _animationController.repeat();
  //   }
  // }

  // @override
  // bool get wantKeepAlive => true;

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var height = fonts.height(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height * 0.177,
        width: double.maxFinite,
        child: PageView.builder(
            padEnds: false,
            scrollDirection: Axis.horizontal,
            itemCount: advertdetails?.length,
            itemBuilder: ((context, index) {
              // index = start;
              return advertdetails == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Color.fromARGB(255, 255, 119, 0),
                      ),
                    )
                  : Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                          CustomNetworkImage(
                            height: double.maxFinite,
                            imageurl: advertdetails![index].Imageurl,
                            radius: 15,
                            width: double.maxFinite,
                          ),
                          Positioned(
                            child: Wrap(
                              spacing: 3,
                              children: List.generate(
                                  advertdetails!.length,
                                  (ind) => Container(
                                        height: index == ind ? 10 : 10,
                                        width: index == ind ? 20 : 10,
                                        decoration: BoxDecoration(
                                            borderRadius: index != ind
                                                ? null
                                                : BorderRadius.circular(10),
                                            shape: index != ind
                                                ? BoxShape.circle
                                                : BoxShape.rectangle,
                                            color: index == ind
                                                ? const Color.fromARGB(
                                                    255, 247, 247, 245)
                                                : Colors.grey),
                                      )),
                            ),
                          )
                        ]);
            })),
      ),
    );
  }
}

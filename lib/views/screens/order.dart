import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/models/order.dart';
import 'package:shopex/core/services/firestore/orders.dart';
import 'package:shopex/views/constant/fonts.dart';

import 'package:shopex/views/widgets/orderbottomsheet.dart';

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);
  final OrderService _orderService = OrderService();
  Fonts fonts = Fonts();

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Ordermodel>?>.value(
        value: OrderService().allorder,
        initialData: null,
        child: Scaffold(
          body: Column(
            children: [
              _buildtopbar(context),
              _buildList(context),
            ],
          ),
        ));
  }

  Widget _buildtopbar(BuildContext context) {
    var textfont = fonts.textfont(context);
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: const Text("Orders"),
      titleTextStyle: GoogleFonts.sora(
          fontSize: textfont * 0.027,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.deepPurple),
    );
  }

  Widget _buildList(BuildContext context) {
    var height = fonts.height(context);
    var width = fonts.width(context);
    var textfont = fonts.textfont(context);
    return Consumer<List<Ordermodel>?>(builder: (context, value, child) {
      var orders = value;
      return Expanded(
          child: orders == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        _orderService.order(orders[index].id);
                      },
                      resizeDuration: const Duration(milliseconds: 300),
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: const Icon(
                          Icons.delete,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: height * 0.204,
                        width: double.maxFinite,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Spacer(),
                                Text(
                                    orders[index]
                                        .date
                                        .toDate()
                                        .toString()
                                        .split(" ")
                                        .first,
                                    style: GoogleFonts.sora(
                                      fontSize: textfont * 0.0204,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            Text("Order Id: ${orders[index].id}",
                                style: GoogleFonts.andadaPro(
                                  fontSize: textfont * 0.020,
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Qunatity: ${orders[index].quantity}",
                                    style: GoogleFonts.andadaPro(
                                      fontSize: textfont * 0.020,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text(
                                    "Total Amount: ₦${orders[index].amount * orders[index].quantity}",
                                    style: GoogleFonts.andadaPro(
                                      fontSize: textfont * 0.020,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                        backgroundColor: Colors.grey.shade400,
                                        isDismissible: false,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        context: (context),
                                        builder: (context) {
                                          return OrderBottomSheet(
                                              index: index, orders: orders);
                                        });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.054,
                                    width: width * 0.28,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: textfont * 0.020),
                                    ),
                                  ),
                                ),
                                Text(orders[index].status,
                                    style: GoogleFonts.andadaPro(
                                      fontSize: textfont * 0.025,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black)),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.014,
                    );
                  },
                  itemCount: orders.length));
    });
  }
}

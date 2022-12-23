import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/helper/databasehelper.dart';
import 'package:shopex/core/view_model/addtocart.dart';

import 'package:shopex/core/view_model/navigator.dart';
import 'package:shopex/views/list_screen/list_screen.dart';

import '../../core/models/cartproduct.dart';
import '../../core/notification/notification.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {


  @override
  void initState() {
    super.initState();
    Token.token.getToken();
    // AccessNoftification.fcm.getToken();
    AccessNoftification.fcm.loadmessage();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AddToCart>(context).readcart();
  }

  @override
  Widget build(BuildContext context) {
    var setstate = Provider.of<NavigatorViewModel>(context);
    return Scaffold(
      body: screens.elementAt(setstate.index),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 160, 6, 187),
          currentIndex: setstate.index,
          onTap: (value) {
            setstate.changeScreen(value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Badge(
                toAnimate: false,
                child: const Icon(Icons.shopping_cart),
                badgeContent: Text("${cart.length}"),
                badgeColor: Colors.white,
              ),
              label: "Cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]),
    );
  }
}

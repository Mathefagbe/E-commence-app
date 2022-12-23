import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopex/core/helper/databasehelper.dart';
import 'package:shopex/core/models/advert.dart';
import 'package:shopex/core/models/cloths.dart';
import 'package:shopex/core/models/flashDeal.dart';
import 'package:shopex/core/models/products.dart';
import 'package:shopex/core/models/shoe.dart';
import 'package:shopex/core/models/topdeals.dart';
import 'package:shopex/core/services/firestore/advert.dart';
import 'package:shopex/core/services/firestore/all_cartegory.dart';
import 'package:shopex/core/services/firestore/cloth_category.dart';
import 'package:shopex/core/services/firestore/flashdeal.dart';
import 'package:shopex/core/services/firestore/shoecategory.dart';
import 'package:shopex/core/services/firestore/sneaker_category.dart';
import 'package:shopex/core/services/firestore/todeal.dart';
import 'package:shopex/core/view_model/addtocart.dart';
import 'package:shopex/core/view_model/imagepicker.dart';
import 'package:shopex/core/view_model/navigator.dart';
import 'package:shopex/core/view_model/productsize.dart';
import 'package:shopex/views/screens/navigation.dart';
import 'core/models/cartproduct.dart';
import 'core/models/sneakers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndriod =
      const AndroidInitializationSettings("app_icons");
  var initSettings =
      InitializationSettings(android: initializationSettingsAndriod);
  await FlutterLocalNotificationsPlugin().initialize(
    initSettings,
  );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // FirebaseOptions options = const FirebaseOptions(
  //     apiKey: "AIzaSyDW6xoqg70Y8vm-NKQtQKw-xeVl5sxEG24",
  //     appId: "1:496856195399:web:5d76ca5455fa6c76e96c62",
  //     messagingSenderId: "496856195399",
  //     projectId: "shopx-daae8");
  await Firebase.initializeApp();
  await DataBaseService.data.init();
  await DataBaseService.data.read().then((value) {
    cart = value;
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<AllProducts>?>(
          create: (context) => AllCategory().allItem(),
          initialData: null,
        ),
        FutureProvider<List<FlashDealModel>?>(
          create: (context) => FlashDealService().flash(),
          initialData: null,
        ),
        FutureProvider<List<TopDealModel>?>(
          create: (context) => TopDealService().topdeal(),
          initialData: null,
        ),
        FutureProvider<List<ShoeProduct>?>(
          create: (context) => ShoeCategory().shoeitem(),
          initialData: null,
        ),
        FutureProvider<List<SneakersProducts>?>(
          create: (context) => SneakersCategory().allItem(),
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => NavigatorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Images(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductSize(),
        ),
        ChangeNotifierProvider(
          lazy: true,
          create: (context) => AddToCart(),
        ),
        FutureProvider<List<Advert>?>.value(
          value: Advertservice().advert,
          initialData: null,
        ),
        FutureProvider<List<ClothProducts>?>(
          create: (context) => ClothCategory().clothitem(),
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const NavigationScreen(),
      ),
    );
  }
}

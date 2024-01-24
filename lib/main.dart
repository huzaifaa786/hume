// ignore_for_file: prefer_const_constructors, unused_import, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
 import 'package:hume/helper/loading.dart';
import 'package:hume/routes/app_pages.dart';
import 'package:hume/services/notification_service.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/cart/cart_controller.dart';
import 'package:hume/views/search_product.dart/search_product_controller.dart';
import 'package:hume/views/splash/splash_binding.dart';
import 'package:hume/views/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/payment_service.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadingHelper.init();
  Get.put(SearchProductController());
  Get.put(PaymentService());
  Get.put(NotificationService());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey =
      "pk_test_51JvIZ1Ey3DjpASZjPAzcOwqhblOq2hbchp6i56BsjapvhWcooQXqh33XwCrKiULfAe7NKFwKUhn2nqURE7VZcXXf00wMDzp4YN";

  // Stripe.merchantIdentifier = 'merchant.com.ezmove';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetStorage box = GetStorage();
    // box.read('Locale') == null ? box.write('Locale', 'en') : null;
    // String locale = box.read('Locale') == null ? 'en' : box.read('Locale');
    // return  GoogleTranslatorInit('AIzaSyBOr3bXgN2bj9eECzSudyj_rgIFjyXkdn8',
    //     translateFrom: box.read('Locale') == 'en' ? Locale('ur') : Locale('en'),
    //     translateTo: Locale(locale),
    //     automaticDetection: false, builder: () {
    return GetMaterialApp(
      // translations: LocaleString(),
      // locale:
      //     box.read('locale') != 'ar' ? Locale('en', 'US') : Locale('ar', 'AE'),
      // fallbackLocale:
      //     box.read('locale') != 'ar' ? Locale('en', 'US') : Locale('ar', 'AE'),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: white,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "Hume",
      initialBinding: SplashBinding(),
      home: SplashView(),
      getPages: AppPages.pages,
    );
    // });
  }
}

import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/account/account_binding.dart';
import 'package:hume/views/account/account_view.dart';
import 'package:hume/views/auth/auth_binding.dart';
import 'package:hume/views/auth/auth_controller.dart';
import 'package:hume/views/auth/auth_options_view.dart';
import 'package:hume/views/auth/auth_view.dart';
import 'package:hume/views/categories/categories_binding.dart';
import 'package:hume/views/categories/categories_view.dart';
import 'package:hume/views/category_products/product_binding.dart';
import 'package:hume/views/category_products/product_view.dart';
import 'package:hume/views/home/home_binding.dart';
import 'package:hume/views/home/home_view.dart';
import 'package:hume/views/main_screen/main_screen.dart';
import 'package:hume/views/main_screen/main_screen_binding.dart';
import 'package:hume/views/shops/shops_view/shops_view.dart';
import 'package:hume/views/shops/shops_view/shops_binding.dart';
import 'package:hume/views/splash/splash_binding.dart';
import 'package:hume/views/splash/splash_view.dart';
import 'package:hume/views/welcome/welcome_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
    ),

    GetPage(
      name: AppRoutes.auth_options,
      page: () => const AuthOptions(),
    ),

    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),   
    
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainScreenBinding(),
    ),
    
    GetPage(
      name: AppRoutes.categories,
      page: () => const CategoriesScreen(),
      binding: CategoriesBinding(),
    ),

    GetPage(
      name: AppRoutes.products,
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
    
    GetPage(
      name: AppRoutes.account,
      page: () => const AccountScreen(),
      binding: AccountBinding(),
    ),

    ///Shops List
    GetPage(
      name: AppRoutes.shops,
      page: () => const ShopsView(),
      binding: ShopsBinding(),
    ),
  ];
}
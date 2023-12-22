import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/account/account_binding.dart';
import 'package:hume/views/account/account_view.dart';
import 'package:hume/views/auth/auth_binding.dart';
import 'package:hume/views/auth/auth_controller.dart';
import 'package:hume/views/auth/auth_options_view.dart';
import 'package:hume/views/auth/auth_view.dart';
import 'package:hume/views/cart/cart_binding.dart';
import 'package:hume/views/cart/cart_view.dart';
import 'package:hume/views/categories/categories_binding.dart';
import 'package:hume/views/categories/categories_view.dart';
import 'package:hume/views/category_products/product_binding.dart';
import 'package:hume/views/category_products/product_view.dart';
import 'package:hume/views/checkout/checkout_binding.dart';
import 'package:hume/views/checkout/checkout_view.dart';
import 'package:hume/views/home/home_binding.dart';
import 'package:hume/views/home/home_view.dart';
import 'package:hume/views/main_screen/main_screen.dart';
import 'package:hume/views/main_screen/main_screen_binding.dart';
import 'package:hume/views/orders/order_binding.dart';
import 'package:hume/views/orders/orders_view.dart';
import 'package:hume/views/product_deatil/product_deatil_binding.dart';
import 'package:hume/views/product_deatil/product_detail_view.dart';
import 'package:hume/views/shops/shop_profile/shop_profile_binding.dart';
import 'package:hume/views/shops/shop_profile/shop_profile_view.dart';
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

    GetPage(
      name: AppRoutes.shop_profile,
      page: () => const ShopProfileView(),
      binding: ShopProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),

    GetPage(
      name: AppRoutes.checkout,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),

    ///Product Detail
    GetPage(
        name: AppRoutes.productDeatil,
        page: () => const ProductDetailView(),
        binding: ProductDetailBinding()),

    /// My Orders
    GetPage(
        name: AppRoutes.orders,
        page: () => const OrdersView(),
        binding: OrdersBinding()),
  ];
}

import 'package:get/get.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/cart/cart_controller.dart';
import 'package:hume/views/category_products/cactegory_product_controller.dart';
import 'package:hume/views/home/home_controller.dart';
import 'package:hume/views/shops/shops_view/shops_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    print("AAAAAAAAAAAAa");
     
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CategoryProductController());
    Get.lazyPut(() => ShopsController());
    Get.lazyPut(() => AccountController());
  
  }
}

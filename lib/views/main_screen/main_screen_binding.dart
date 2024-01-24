import 'package:get/get.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/home/home_controller.dart';
import 'package:hume/views/shops/shops_view/shops_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ShopsController());
    Get.lazyPut(() => AccountController());
  }
}

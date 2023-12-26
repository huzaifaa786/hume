import 'package:get/get.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/category_products/product_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}

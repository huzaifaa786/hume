import 'package:get/get.dart';
import 'package:hume/views/shop_products/shop_products_controller.dart';

class ShopProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopProductsController());
  }
}

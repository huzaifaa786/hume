import 'package:get/get.dart';
import 'package:hume/views/orders/order_products/order_products_controller.dart';

class OrderProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderProductsController());
  }
}

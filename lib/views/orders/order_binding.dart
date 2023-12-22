import 'package:get/get.dart';
import 'package:hume/views/orders/order_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}

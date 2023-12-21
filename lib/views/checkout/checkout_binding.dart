import 'package:get/get.dart';
import 'package:hume/views/checkout/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}

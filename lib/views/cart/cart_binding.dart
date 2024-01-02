import 'package:get/get.dart';
import 'package:hume/views/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => CartController());
  
  }
}

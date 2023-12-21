import 'package:get/get.dart';
import 'package:hume/views/shops/shops_view/shops_controller.dart';

class ShopsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopsController());
  }
}

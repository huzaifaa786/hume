import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController instance = Get.find();
  int tabIndex = 0;
  void setIndex(index) {
    tabIndex = index;
    update();
  }
}

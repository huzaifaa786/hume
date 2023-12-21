import 'package:get/get.dart';

class ShopsController extends GetxController {
  static ShopsController instance = Get.find();
  RxInt counter = 0.obs;

  void increment() {
    counter.value++;
  }
}

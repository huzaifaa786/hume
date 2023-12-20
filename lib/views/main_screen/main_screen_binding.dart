import 'package:get/get.dart';
import 'package:hume/views/home/home_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

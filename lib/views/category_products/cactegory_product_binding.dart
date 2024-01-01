import 'package:get/get.dart';
import 'package:hume/views/category_products/cactegory_product_controller.dart';

class CategoryProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryProductController());
  }
}

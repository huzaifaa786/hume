import 'package:get/get.dart';
import 'package:hume/views/search_product.dart/search_product_controller.dart';

class SearchProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>SearchProductController());
  }
}

import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/combined_data.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController instance = Get.find();
  ProductApi productApi = ProductApi();
  ProductShopCombined? combinedProductData;
  @override
  void onInit() {
    fetchProductById();
    super.onInit();
  }

  void fetchProductById() async {
    LoadingHelper.show();
    final fetchedProduct =
        await productApi.fetchProductById(Get.parameters['id']!);
    combinedProductData = fetchedProduct;
    LoadingHelper.dismiss();
    update();
  }
}

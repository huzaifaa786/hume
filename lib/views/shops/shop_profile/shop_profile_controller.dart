import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/api/shop_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';
import 'package:hume/models/shop.dart';

class ShopProfileController extends GetxController {
  final ShopApi shopApi = ShopApi();
  final ProductApi productApi = ProductApi();
  Shop? shop;
  List<Product> products = [];

  @override
  void onInit() {
    fetchShopAndProducts(Get.parameters['shop_id']);
    super.onInit();
  }

  Future<void> fetchShopAndProducts(shopId) async {
    LoadingHelper.show();
    shop = await shopApi.getShopData(shopId);
    products = await shopApi.fetchProductsByShopwithLimit6("1");
    update();
    LoadingHelper.dismiss();
  }
}

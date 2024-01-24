import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/combined_data.dart';
import 'package:hume/utils/ui_utils.dart';

class ProductDetailController extends GetxController {
  static ProductDetailController instance = Get.find();
  ProductApi productApi = ProductApi();
  CartHelper cartHelper = CartHelper();
  ProductShopCombined? combinedProductData;
  String? selectedSize;
  int qty = 1;
  int total = 0;
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
    selectedSize = combinedProductData!.product.sizes!.isNotEmpty
        ? combinedProductData!.product.sizes!.first
        : null;

    total = int.parse(combinedProductData!.product.price!);
    LoadingHelper.dismiss();
    update();
  }
  int currentIndex = 0;


    void setCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  void addToCart() async {
   bool isAdded = await cartHelper.addProduct(
        combinedProductData!.product.id,
        combinedProductData!.shop.id,
        selectedSize != null ? selectedSize : null,
        qty,
        int.parse(combinedProductData!.product.price!));
    if (isAdded) 
    UiUtilites.successSnackbar(
        combinedProductData!.product.name! + " added to cart successfully",
        'Added to cart');
  }

  
}

import 'package:get/get.dart';
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/models/cart_item.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  final cartHelper = CartHelper();
  List<CartItem> cartItems = [];
  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.total);
  }

  @override
  void onInit() {
    loadCartFromFirestore();
    super.onInit();
  }

  Future<void> loadCartFromFirestore() async {
    cartItems = await cartHelper.loadCartFromFirestore();
    print(cartItems);
    update();
  }

  Future<void> updateCart(String productId, String? size, int quantity) async {
    cartItems = await cartHelper.updateQuantity(productId, size, quantity);
    update();
  }

  Future<void> removeProduct(String productId, String? size) async {
    cartItems = await cartHelper.removeProduct(productId, size);
    Get.back();
    update();
  }
}

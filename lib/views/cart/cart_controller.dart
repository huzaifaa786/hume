import 'package:get/get.dart';
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/models/cart_item.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  final cartHelper = CartHelper();
  List<CartItem> cartItems = [];

  @override
  void onInit() {
    loadCartFromFirestore();
    super.onInit();
  }

  void loadCartFromFirestore() {
    cartHelper.loadCartFromFirestore();
    cartItems = cartHelper.cartItems;
  }
}

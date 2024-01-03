import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/account_api.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/api/order_api.dart';
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/app_user.dart';
import 'package:hume/models/cart_item.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/order_item.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/services/payment_service.dart';
import 'package:hume/utils/ui_utils.dart';
import 'package:hume/views/cart/cart_controller.dart';

class CheckoutController extends GetxController {
  static CheckoutController instance = Get.find();
  final _accountApi = AccountApi();
  final _orderApi = OrderApi();
  final Rx<AppUser?> user = Rx<AppUser?>(null);
  final cartHelper = CartHelper();
  final paymentService = PaymentService();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  List<CartItem> cartItems = [];
  int get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + item.total);
  }

  @override
  void onInit() {
    fetchUser(FirebaseAuth.instance.currentUser!.uid);
    loadCartFromFirestore();
    super.onInit();
  }

  Future confirmPayment() async {
    if (name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        address.text.isNotEmpty &&
        totalAmount > 0) {
      LoadingHelper.show();
      bool isPaymentDone = await paymentService.makePayment(totalAmount);
      
      if (isPaymentDone) {
        String orderId = DateTime.now().millisecondsSinceEpoch.toString();

        final UserOrder order = UserOrder(
            id: orderId,
            name: name.text,
            phone: phone.text,
            address: address.text,
            total: totalAmount.toString(),
            userId: user.value!.id,
            status: "0",
            shopId: cartItems.first.shopId,
            paymentIntent:paymentService.paymentIntent.toString());

        await _orderApi.storeOrder(order);

        for (var item in cartItems) {
          String itemId = DateTime.now().millisecondsSinceEpoch.toString();
          final OrderItem orderItem = OrderItem(
            id: itemId,
            orderId: orderId,
            productId: item.productId,
            quantity: item.quantity.toString(),
            size: item.size != null ? item.size : null,
            total: item.total.toString(),
          );
          await _orderApi.storeOrderItem(orderItem);
        }
        cartHelper.clearCart();

       

        Get.offAllNamed(AppRoutes.main);
        UiUtilites.successSnackbar(
            'Your order has been placed successfully', 'Order Placed');
      }
      LoadingHelper.dismiss();
    } else {
      UiUtilites.errorSnackbar(
          'Fill out All the Fields', 'Please fill in all the fields');
    }
  }

  Future<void> loadCartFromFirestore() async {
    cartItems = await cartHelper.loadCartFromFirestore();
    update();
  }

  Future<void> fetchUser(String userId) async {
    LoadingHelper.show();
    final fetchedUser = await _accountApi.getUserById(userId);
    user.value = fetchedUser;
    name.text = user.value!.name.toString();
    phone.text = user.value!.phone.toString();
    update();
    LoadingHelper.dismiss();
  }
}

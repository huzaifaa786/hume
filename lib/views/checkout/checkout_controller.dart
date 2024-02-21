import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/account_api.dart';
import 'package:hume/api/notification_api.dart';
import 'package:hume/api/order_api.dart';
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/app_user.dart';
import 'package:hume/models/cart_item.dart';
import 'package:hume/models/notification_model.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/order_item.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/services/notification_service.dart';
import 'package:hume/services/payment_service.dart';
import 'package:hume/utils/ui_utils.dart';

class CheckoutController extends GetxController {
  static CheckoutController instance = Get.find();
  final _accountApi = AccountApi();
  final _notificationApi = NotificationApi();
  final _notificationservice = NotificationService();

  final _orderApi = OrderApi();
  final Rx<AppUser?> user = Rx<AppUser?>(null);
  final cartHelper = CartHelper();
  final paymentService = PaymentService();
  String token = '';
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
      List shopIDs = [];
      for (var id in cartItems) {
        shopIDs.add(id.shopId);
      }
      print(shopIDs);
      LoadingHelper.show();
      bool isPaymentDone = await paymentService.makePayment(totalAmount);
      print(isPaymentDone);
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
            shopId: shopIDs,
            paymentIntent: paymentService.paymentIntent.toString());

        await _orderApi.storeOrder(order);

        for (var item in cartItems) {
          String itemId = DateTime.now().millisecondsSinceEpoch.toString();
          final OrderItem orderItem = OrderItem(
              id: itemId,
              orderId: orderId,
              productId: item.productId,
              quantity: item.quantity.toString(),
              size: item.size != ''
                  ? item.shoeSize != ''
                      ? '${item.shoeSize}' + ' ${item.size} '
                      : item.size
                  : item.shoeSize != null
                      ? '${item.shoeSize}'
                      : null,
              total: item.total.toString(),
              shopId: item.shopId);
          await _orderApi.storeOrderItem(orderItem);
        }
        cartHelper.clearCart();
        String notiId = DateTime.now().millisecondsSinceEpoch.toString();
        await _notificationApi.storeNotification(NotificationModel(
            notificationId: notiId,
            orderId: orderId,
            userId: FirebaseAuth.instance.currentUser!.uid,
            shopId: cartItems.first.shopId,
            content: 'Order Placed',
            forAdmin: true,
            seen: false));
        _notificationservice.postNotification(
            title: 'Order Placed'.tr,
            body: 'New order has been placed.'.tr,
            receiverToken: token);
        Get.offAllNamed(AppRoutes.main);
        UiUtilites.successSnackbar(
            'Your order has been placed successfully'.tr, 'Order Placed'.tr);
      }
      LoadingHelper.dismiss();
    } else {
      UiUtilites.errorSnackbar(
          'Fill out All the Fields'.tr, 'Please fill in all the fields'.tr);
    }
  }

  Future<void> loadCartFromFirestore() async {
    cartItems = await cartHelper.loadCartFromFirestore();
    cartItems.first.shopId;
    update();
  }

  Future<void> fetchUser(String userId) async {
    LoadingHelper.show();
    final fetchedUser = await _accountApi.getUserById(userId);
    user.value = fetchedUser;
    name.text = fetchedUser!.name.toString();
    if (fetchedUser.phone != null) {
      phone.text = user.value!.phone.toString();
    }
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('IMdPreVtj4QBHhTA1UkX5ngOg323')
        .get();
    if (snapshot.exists) {
      final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      token = data['token'] as String;
    }
    update();
    LoadingHelper.dismiss();
  }
}

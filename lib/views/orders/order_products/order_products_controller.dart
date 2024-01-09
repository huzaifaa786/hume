// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:get/get.dart';
import 'package:hume/api/order_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/order_item.dart';

class OrderProductsController extends GetxController {
  static OrderProductsController instance = Get.find();
  final _orderApi = OrderApi();

  final String orderId = Get.parameters['orderId'].toString();
  List<OrderItem> fetchOrderItems = [];
  List<Map<String, dynamic>> products = [];

  @override
  void onInit() {
    super.onInit();
    fetchproducts();
    update();
  }

  fetchproducts() async {
    LoadingHelper.show();
    fetchOrderItems = await _orderApi.fetchOrderItems(orderId);
    for (var orderitem in fetchOrderItems) {
      final productDetail =
          await _orderApi.fetchProduct(orderitem.productId.toString());

      final product = {
        'productName': productDetail!.name.toString(),
        'productImage': productDetail.images![0],
        'size': orderitem.size,
        'quantity': orderitem.quantity,
        'total': orderitem.total,
      };
      products.add(product);
    }
    update();
    LoadingHelper.dismiss();
  }
}

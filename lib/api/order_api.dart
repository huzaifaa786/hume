// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:hume/exceptions/database_api_exception.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/order_item.dart';
import 'package:hume/models/product.dart';

class OrderApi {
  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference orderItemCollection =
      FirebaseFirestore.instance.collection('orderItems');
        final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection("products");

List<OrderItem> orderItems = [];

  Future<void> storeOrder(UserOrder order) async {
    await orderCollection.doc(order.id).set(order.toJson());
  }

  Future<void> storeOrderItem(OrderItem orderItem) async {
    await orderItemCollection.doc(orderItem.id).set(orderItem.toJson());
  }

  Future<List<UserOrder>> fetchAllOrders(String userId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await orderCollection
          .where('userId', isEqualTo: userId)
          .get() as QuerySnapshot<Map<String, dynamic>>;
      final List<UserOrder> orders = snapshot.docs
          .map((doc) => UserOrder.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return orders;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
          title: 'Failed to fetch orders', message: e.message);
    }
  }

  Future<List<OrderItem>> fetchOrderItems(String orderId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await orderItemCollection.where('orderId', isEqualTo: orderId).get()
              as QuerySnapshot<Map<String, dynamic>>;

      final List<OrderItem> fetchedorderItems = snapshot.docs
          .map((doc) =>
              OrderItem.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return fetchedorderItems;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch order items',
        message: e.message,
      );
    }
  }

  Future<Product?> fetchProduct(String productId) async {
    final QuerySnapshot<Object?> product =
        await _productCollection.where('id', isEqualTo: productId).get();
    if (product.docs.isNotEmpty) {
      final productData = product.docs.first.data() as Map<String, dynamic>;
      final productObject = Product.fromJson(productData);

      return productObject;
    } else {
      return null;
    }
  }
}

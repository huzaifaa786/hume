import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/order_item.dart';

class OrderApi {
  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orders');
  final CollectionReference orderItemCollection =
      FirebaseFirestore.instance.collection('orderItems');

  Future<void> storeOrder(UserOrder order) async {
    await orderCollection.doc(order.id).set(order.toJson());
  }

  Future<void> storeOrderItem(OrderItem orderItem) async {
    await orderItemCollection.doc(orderItem.id).set(orderItem.toJson());
  }
}

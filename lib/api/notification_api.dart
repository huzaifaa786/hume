// ignore_for_file: unnecessary_cast, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hume/exceptions/database_api_exception.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/notification_model.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/shop.dart';

class NotificationApi {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _notificationCollection =
      _firestore.collection("notifications");

  Future<List<NotificationModel>> fetchNotifications() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _notificationCollection
              .where('userId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where('forAdmin', isEqualTo: false)
              .orderBy('notificationId', descending: true)
              .get() as QuerySnapshot<Map<String, dynamic>>;
      final List<NotificationModel> notifications = snapshot.docs
          .map((doc) =>
              NotificationModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return notifications;
    } on PlatformException catch (e) {
      throw DatabaseApiException(
        title: 'Failed to fetch notifications',
        message: e.message,
      );
    }
  }

  Future<Shop> fetchShop(String shopId) async {
    final shopSnapshot =
        await FirebaseFirestore.instance.collection('shops').doc(shopId).get();
    final shopData = shopSnapshot.data() as Map<String, dynamic>;
    return Shop.fromJson(shopData);
  }

  Future<UserOrder> fetchOrder(String orderId) async {
    final orderSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .get();
    final orderData = orderSnapshot.data() as Map<String, dynamic>;
    return UserOrder.fromJson(orderData);
  }

  storeNotification(NotificationModel notification) {
    LoadingHelper.show();
    var collectionReference =
        FirebaseFirestore.instance.collection('notifications');
    var documentReference =
        collectionReference.doc(notification.notificationId);
    documentReference.set({
      'notificationId': notification.notificationId,
      'userId': notification.userId,
      'shopId': notification.shopId,
      'orderId': notification.orderId,
      'content': notification.content,
      'forAdmin': notification.forAdmin,
      'seen': notification.seen,
    }).then((value) {
      // not
      LoadingHelper.dismiss();
      print('Notification stored successfully');
      return;
    }).catchError((error) {
      LoadingHelper.dismiss();
      print('Error storing notification: $error');
      return;
    });
    return null;
  }
}

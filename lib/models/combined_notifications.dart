import 'package:hume/models/notification_model.dart';
import 'package:hume/models/order.dart';
import 'package:hume/models/shop.dart';

class NotificationCombinedModel {
  final NotificationModel notification;
  final UserOrder order;
  final Shop shop;

  NotificationCombinedModel(
      {required this.order,
      required this.shop,
      required this.notification});
}

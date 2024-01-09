import 'package:get/get.dart';
import 'package:hume/api/notification_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/combined_notifications.dart';
import 'package:hume/models/notification_model.dart';

class NotificationController extends GetxController {
  static NotificationController instance = Get.find();
  final _notificationApi = NotificationApi();
  List<NotificationModel> fetchednotifications = [];
  List<NotificationCombinedModel> extendedNotifications = [];

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
    update();
  }

  fetchNotifications() async {
    LoadingHelper.show();
    fetchednotifications = await _notificationApi.fetchNotifications();
    for (var notification in fetchednotifications) {
      final shop = await _notificationApi.fetchShop(notification.shopId);
      final order = await _notificationApi.fetchOrder(notification.orderId);

      final combinedNotification = NotificationCombinedModel(
        notification: notification,
        order: order,
        shop: shop,
      );

      extendedNotifications.add(combinedNotification);
    }
    LoadingHelper.dismiss();
    update();
  }
}

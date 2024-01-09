// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/date_time_convertion.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/notifications/notification_card.dart';
import 'package:hume/views/notifications/notification_controller.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'Notifications',
        body: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: controller.extendedNotifications.length,
            itemBuilder: (context, index) {
              final notification = controller.extendedNotifications[index];
              var date = convertTimestampToDate(notification.order.id);
              return NotificationCard(
                ontap: () {
                  // Get.toNamed(AppRoutes.orders,
                  //     parameters: {'orderId': notification.order.id});
                },
                orderId: 'order No ${notification.order.id}',
                date: date,
                shopName: notification.shop.name,
                content: notification.notification.content,
              );
            }),
      ),
    );
  }
}

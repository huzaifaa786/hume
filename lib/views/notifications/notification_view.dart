// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/notifications/notification_card.dart';
import 'package:hume/views/notifications/notification_controller.dart';

class NotificationsView extends GetView<NotificationController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        appBarTitle: 'Notifications',
        body: Column(
          children: [
            NotificationCard(
              date: '22/11/2023',
              orderstatus: 'Accepted order!',
              icon: SvgPicture.asset('assets/images/checked_yellow.svg'),
              orderId: 'order No 1',
            )
          ],
        ));
  }
}

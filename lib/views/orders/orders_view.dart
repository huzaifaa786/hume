// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/orders/order_card.dart';
import 'package:hume/views/orders/order_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'My Orders',
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ToggleSwitch(
                initialLabelIndex: controller.tabIndex,
                labels: [
                  'All',
                  'Accepted',
                  'Delivered',
                  'Rejected',
                ],
                totalSwitches: 4,
                onToggle: (index) {
                  controller.setIndex(index);
                },
                borderWidth: 3,
                radiusStyle: true,
                fontSize: 13,
                minWidth: 80,
                borderColor: [white],
                minHeight: 30,
                cornerRadius: 40,
                changeOnTap: true,
                inactiveFgColor: Colors.grey,
                activeFgColor: Color.fromARGB(255, 255, 255, 255),
                inactiveBgColor: Color.fromARGB(255, 255, 255, 255),
                activeBgColor: [litePurple],
                activeBorders: [
                  Border.all(
                    color: litePurple,
                    width: 3.0,
                  ),
                  Border.all(
                    color: litePurple,
                    width: 3.0,
                  ),
                ],
              ),
            ),
            Gap(15),
            OrderCard(
              ontap: () {},
              date: '22/11/2023',
              id: '1',
              price: '350.00',
              status: 1,
            ),
            OrderCard(
              ontap: () {},
              date: '22/11/2023',
              id: '2',
              price: '350.00',
              status: 2,
            ),
            OrderCard(
              ontap: () {},
              date: '22/11/2023',
              id: '3',
              price: '350.00',
              status: 3,
            ),
            Gap(30),
            SvgPicture.asset('assets/images/logo.svg', height: 35, width: 80),
            Gap(30),
          ],
        ),
      ),
    );
  }
}

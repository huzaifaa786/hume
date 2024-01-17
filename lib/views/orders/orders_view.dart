// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/orders/order_card.dart';
import 'package:hume/views/orders/order_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'My Orders',
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ToggleSwitch(
                    initialLabelIndex: controller.tabIndex,
                    labels: [
                      controller.all ?? '',
                      controller.accepted ?? '',
                      controller.completed ?? '',
                      controller.rejected ?? '',
                    ],
                    totalSwitches: 4,
                    onToggle: (index) {
                      controller.setIndex(index);
                    },
                    borderWidth: 3,
                    radiusStyle: true,
                    fontSize: 10,
                    minWidth: 80,
                    borderColor: [white],
                    minHeight: 30,
                    multiLineText: true,
                    centerText: true,
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
                controller.tabIndex == 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.allOrders.length,
                        itemBuilder: (context, index) {
                          final order = controller.allOrders[index];
                          return OrderCard(
                            ontap: () {
                              Get.toNamed(AppRoutes.order_products,
                                  parameters: {'orderId': order['id']});
                            },
                            date: order['date'],
                            id: order['id'],
                            price: order['total'],
                            status: order['status'],
                          );
                        })
                    : controller.tabIndex == 1
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.acceptedOrders.length,
                            itemBuilder: (context, index) {
                              final order = controller.acceptedOrders[index];
                              return OrderCard(
                                ontap: () {
                                  Get.toNamed(AppRoutes.order_products,
                                      parameters: {'orderId': order['id']});
                                },
                                date: order['date'],
                                id: order['id'],
                                price: order['total'],
                                status: order['status'],
                              );
                            })
                        : controller.tabIndex == 2
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.deliveredOrders.length,
                                itemBuilder: (context, index) {
                                  final order =
                                      controller.deliveredOrders[index];
                                  return OrderCard(
                                    ontap: () {
                                      Get.toNamed(AppRoutes.order_products,
                                          parameters: {'orderId': order['id']});
                                    },
                                    date: order['date'],
                                    id: order['id'],
                                    price: order['total'],
                                    status: order['status'],
                                  );
                                })
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.rejectedOrders.length,
                                itemBuilder: (context, index) {
                                  final order =
                                      controller.rejectedOrders[index];
                                  return OrderCard(
                                    ontap: () {
                                      Get.toNamed(AppRoutes.order_products,
                                          parameters: {'orderId': order['id']});
                                    },
                                    date: order['date'],
                                    id: order['id'],
                                    price: order['total'],
                                    status: order['status'],
                                  );
                                }),
                Gap(30),
                SvgPicture.asset('assets/images/logo.svg',
                    height: 35, width: 80),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

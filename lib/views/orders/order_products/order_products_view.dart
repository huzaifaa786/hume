// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/components/order_products_card.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/orders/order_controller.dart';
import 'package:hume/views/orders/order_products/order_products_controller.dart';

class OrderProductsView extends GetView<OrdersController> {
  const OrderProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderProductsController>(
        builder: (controller) => LayoutScaffold(
              appBarTitle: 'Orders'.tr,
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      final product = controller.products[index];
                      return OrderProductsCard(
                        image: Image.network(
                          product['productImage'],
                          width: 137,
                          height: 156,
                        ),
                        price: product['total'],
                        size: product['size'],
                        name: product['productName'],
                        quantity: product['quantity'],
                      );
                    }),
              )),
            ));
  }
}

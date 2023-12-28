// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/models/product.dart';
import 'package:hume/views/category_products/product_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      autoRemove: false,
      // initState: (state) async {
      //   Future.delayed(const Duration(milliseconds: 1), () {
      //   });
      // },
      builder: (controller) => LayoutScaffold(
        appBarTitle: Get.parameters['category'] ?? 'New Arrivals',
        body: SafeArea(child: Container()),
      ),
    );
  }
}


// SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                   ProductCard(
//                     name: 'asasd',
//                     price: '50',
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
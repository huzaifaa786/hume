// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/shop_products/shop_products_controller.dart';

class ShopProductsScreen extends StatelessWidget {
  const ShopProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopProductsController>(
      autoRemove: false,
      builder: (controller) => LayoutScaffold(
        appBarTitle: Get.parameters['shop_name'] ?? '',
        body: SafeArea(
          child: controller.products.isEmpty
              ? Center(
                  child: Text('No products found for this shop.'),
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 290,
                  ),
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ProductCard(
                      name: product.name,
                      price: product.price,
                      img: product.images![0],
                      ontap: () {
                        Get.toNamed(AppRoutes.productDeatil,
                            parameters: {'id': product.id});
                      },
                    );
                  },
                ),
        ),
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
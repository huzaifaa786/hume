// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/category_products/cactegory_product_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryProductController>(
      autoRemove: false,
      builder: (controller) => LayoutScaffold(
        appBarTitle: Get.parameters['category'] ?? 'New Arrivals',
        body: SafeArea(
          child: controller.products.isEmpty
              ? Center(
                  child: Text('No products found for this category.'),
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

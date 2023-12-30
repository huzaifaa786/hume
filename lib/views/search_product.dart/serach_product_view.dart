// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/search_product.dart/search_product_controller.dart';

class SearchProductView extends StatelessWidget {
  const SearchProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductController>(
      autoRemove: false,
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'Search',
        body: SafeArea(
          child: controller.filteredProducts!.isEmpty
              ? Center(
                  child: Text('No products!'),
                )
              : Column(
                  children: [
                    TextField(
                      onChanged: (value) => controller.search(value),
                      decoration: InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.filteredProducts!.length,
                      itemBuilder: (context, index) {
                        final product = controller.filteredProducts![index];
                        return ProductCard(
                            name: product.name,
                            price: product.price,
                            img: product.images![0],
                            ontap: () {
                              Get.toNamed(AppRoutes.productDeatil,
                                  parameters: {'id': product.id});
                            });
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

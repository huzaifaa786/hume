// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/components/search_input.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/controller_initlization.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/search_product.dart/search_product_controller.dart';

class SearchProductView extends StatefulWidget {
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  @override
  void initState() {
    searchProductController.products!.isEmpty
        ? searchProductController.fetchProducts()
        : searchProductController.filteredProducts =
            searchProductController.products;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchProductController>(
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'Search'.tr,
        hasBottomNav: true,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SearchInputField(
                  hint: 'search'.tr,
                  onChange: (value) => searchProductController.search(value),
                ),
                searchProductController.filteredProducts!.isEmpty
                    ? SizedBox(
                        height: Get.height * 0.8,
                        child: Center(
                          child: Text('No products found!'.tr),
                        ))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 293,
                        ),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount:
                            searchProductController.filteredProducts!.length,
                        itemBuilder: (context, index) {
                          final product =
                              searchProductController.filteredProducts![index];
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
      ),
    );
  }
}

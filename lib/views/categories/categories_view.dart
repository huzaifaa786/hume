// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/category_card.dart';
import 'package:hume/components/category_card2.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/layout/layout_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
        appBarTitle: 'Categories',
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      img: 'assets/images/cloths.png',
                      name: 'Clothes',
                      height: 0.2,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Clothes'});
                      },
                    ),
                    CategoryCard(
                      img: 'assets/images/furniture.png',
                      name: 'Furniture',
                      height: 0.3,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Furniture'});
                      },
                    ),
                  ],
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      img: 'assets/images/bags.png',
                      name: 'Bags and\nshoes',
                      height: 0.2,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Bags and shoes'});
                      },
                    ),
                    CategoryCard(
                      img: 'assets/images/makeup.png',
                      name: 'Makeup',
                      height: 0.2,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Makeup'});
                      },
                    ),
                  ],
                ),
                Gap(12),
                CategoryCard2(
                  img: 'assets/images/kitchen.png',
                  name: 'Home & kitchen',
                  height: 0.5,
                  ontap: () {
                    Get.toNamed(AppRoutes.products,
                        parameters: {'category': 'Home & kitchen'});
                  },
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      img: 'assets/images/skin&hair.png',
                      name: 'Skin & Hair\nProducts',
                      height: 0.19,
                      width: 0.35,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Skin & Hair Products'});
                      },
                    ),
                    CategoryCard(
                      img: 'assets/images/perfume.png',
                      name: 'Perfumes',
                      height: 0.19,
                      width: 0.3,
                      fit: BoxFit.fill,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Perfumes'});
                      },
                    ),
                  ],
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      img: 'assets/images/device.png',
                      name: 'Devices',
                      height: 0.19,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Devices'});
                      },
                    ),
                    CategoryCard(
                      img: 'assets/images/accessories.png',
                      name: 'Accessories',
                      height: 0.25,
                      width: 0.4,
                      ontap: () {
                        Get.toNamed(AppRoutes.products,
                            parameters: {'category': 'Accessories'});
                      },
                    ),
                  ],
                ),
                Gap(12),
                CategoryCard2(
                    img: 'assets/images/personalServices.png',
                    name: 'Personal Services',
                    height: 0.18,
                    ontap: () {
                      Get.toNamed(AppRoutes.products,
                          parameters: {'category': 'Personal Services'});
                    }),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryCard(
                        img: 'assets/images/food.png',
                        name: 'Foods',
                        height: 0.16,
                        ontap: () {
                          Get.toNamed(AppRoutes.products,
                              parameters: {'category': 'Foods'});
                        }),
                    // CategoryCard(),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}

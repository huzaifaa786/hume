// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hume/components/category_card.dart';
import 'package:hume/components/category_card2.dart';
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
                      img: 'assets/categories/cloths.png',
                      name: 'Clothes',
                      height: 0.2,
                    ),
                    CategoryCard(
                      img: 'assets/images/furniture.png',
                      name: 'Furniture',
                      height: 0.2,
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
                      height: 0.15,
                    ),
                    CategoryCard(
                      img: 'assets/images/makeup.png',
                      name: 'Makeup',
                      height: 0.2,
                    ),
                  ],
                ),
                Gap(12),
                CategoryCard2(
                    img: 'assets/images/kitchen.png',
                    name: 'Home & kitchen',
                    height: 0.5),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryCard(
                      img: 'assets/images/skin&hair.png',
                      name: 'Skin & Hair\nProducts',
                      height: 0.2,
                    ),
                    CategoryCard(
                      img: 'assets/images/perfume.png',
                      name: 'Perfumes',
                      height: 0.16,
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
                      height: 0.17,
                    ),
                    CategoryCard(
                      img: 'assets/images/accessories.png',
                      name: 'Accessories',
                      height: 0.22,
                    ),
                  ],
                ),
                Gap(12),
                CategoryCard2(
                    img: 'assets/images/personalServices.png',
                    name: 'Personal Services',
                    height: 0.18),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryCard(
                      img: 'assets/images/food.png',
                      name: 'Food',
                      height: 0.16,
                    ),
                    // CategoryCard(),
                  ],
                )
              ],
            ),
          )),
        ));
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/category_circle.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/components/search_input.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/HUME.svg',
                    height: 22,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.cart);
                        },
                        child: SvgPicture.asset(
                          'assets/images/cart.svg',
                          height: 25,
                        ),
                      ),
                      Gap(20),
                      GestureDetector(
                        onTap: (){
                        
                        },
                        child: SvgPicture.asset(
                          'assets/images/notification.svg',
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Gap(30),
              SearchInputField(
                hint: 'search',
              ),
              Gap(20),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      controller.setCurrentIndex(index);
                    },
                  ),
                  items: controller.imgList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: Get.width * 0.9,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: i,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Gap(8),
              CarouselIndicator(
                count: 4,
                index: controller.currentIndex,
                activeColor: mainColor,
                color: Colors.grey,
                width: 6,
              ),
              Gap(30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.18,
                width: Get.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Row(
                      children: [
                        CategoryCircle(
                            imagePath: 'assets/images/1furniture.svg',
                            title: 'Furniture'),
                        CategoryCircle(
                            imagePath: 'assets/images/cloths.svg',
                            title: 'Cloths'),
                        CategoryCircle(
                            imagePath: 'assets/images/perfumes.svg',
                            title: 'Perfumes'),
                        CategoryCircle(
                            imagePath: 'assets/images/makeup.svg',
                            title: 'Makeup'),
                        CategoryCircle(
                            imagePath: 'assets/images/devices.svg',
                            title: 'Devices'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bags & shoes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.products);
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Row(
                    children: [
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                    ],
                  ),
                ),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Furniture',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Row(
                    children: [
                      ProductCard(),
                      ProductCard(),
                      ProductCard(),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

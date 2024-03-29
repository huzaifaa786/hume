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
import 'package:hume/helper/cart_helper.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/home/home_controller.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      autoRemove: false,
      initState: (state) async {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.fetchBannerImages();
          state.controller!.fetchClothesProducts('Clothes');
          state.controller!.fetchperfumeProducts('Perfumes');
          state.controller!.fetchPersonalSerProducts('Personal Services');
          state.controller!.fetchAcceProducts('Accessories');
          state.controller!.fetchSkinProducts('Skin & Hair Products');
          state.controller!.fetchBagsandshoesProducts('Bags and Shoes');
          state.controller!.fetchFurnitureProducts('Craft Tools');
          state.controller!.fetchMakeupProducts('MakeUp');
          state.controller!.fetchHomeandkitchenProducts('Home & Kitchen');
        });
      },
      builder: (controller) => Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
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
                          onTap: () {
                            Get.toNamed(AppRoutes.cart);
                          },
                          child: FutureBuilder(
                            future: CartHelper().loadCartFromFirestore(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return SvgPicture.asset(
                                  'assets/images/cart.svg',
                                  height: 25,
                                );
                              }

                              if (snapshot.data!.isEmpty) {
                                return SvgPicture.asset(
                                  'assets/images/cart.svg',
                                  height: 25,
                                );
                              }

                              return badges.Badge(
                                badgeContent: Text(
                                  '${snapshot.data!.length.toString()}',
                                  style: TextStyle(color: white),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/cart.svg',
                                  height: 25,
                                ),
                              );
                            },
                          ),
                        ),
                        Gap(20),
                        GestureDetector(
                          onTap: () {
                            // paymentService.makePayment(200);
                            Get.toNamed(AppRoutes.notifications);
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
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Gap(30),
              SearchInputField(
                hint: 'search'.tr,
                readOnly: true,
                onpressed: () {
                  Get.toNamed(AppRoutes.search,
                      parameters: {'hasBottomNav': 'false'});
                },
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
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Gap(8),
              CarouselIndicator(
                count: 3,
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
                      'Categories'.tr,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.categories);
                      },
                      child: Text(
                        'See all'.tr,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.18,
                width: Get.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Row(
                      children: [
                        CategoryCircle(
                          ontap: () {
                            Get.toNamed(AppRoutes.products,
                                parameters: {'category': 'Craft Tools'});
                          },
                          imagePath: 'assets/images/craft.svg',
                          title: 'Craft Tools'.tr,
                        ),
                        CategoryCircle(
                          imagePath: 'assets/images/cloths.svg',
                          title: 'Clothes'.tr,
                          ontap: () {
                            Get.toNamed(AppRoutes.products,
                                parameters: {'category': 'Clothes'});
                          },
                        ),
                        CategoryCircle(
                          imagePath: 'assets/images/perfumes.svg',
                          title: 'Perfumes'.tr,
                          ontap: () {
                            Get.toNamed(AppRoutes.products,
                                parameters: {'category': 'Perfumes'});
                          },
                        ),
                        CategoryCircle(
                          imagePath: 'assets/images/makeup.svg',
                          title: 'Makeup'.tr,
                          ontap: () {
                            Get.toNamed(AppRoutes.products,
                                parameters: {'category': 'MakeUp'});
                          },
                        ),
                        // CategoryCircle(
                        //   imagePath: 'assets/images/devices.svg',
                        //   title: 'Devices'.tr,
                        //   ontap: () {
                        //     Get.toNamed(AppRoutes.products,
                        //         parameters: {'category': 'Devices'});
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              controller.clotheproducts.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Clothes'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Clothes'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.clotheproducts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.clotheproducts.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.clotheproducts.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.clotheproducts[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.bagsandshoesproducts.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bags and shoes'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Bags and Shoes'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.bagsandshoesproducts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.bagsandshoesproducts.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    controller.bagsandshoesproducts.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.bagsandshoesproducts[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.furnitureproducts.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Craft Tools'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Craft Tools'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.furnitureproducts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.furnitureproducts.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.furnitureproducts.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.furnitureproducts[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.makeupproducts.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Makeup'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'MakeUp'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.makeupproducts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.makeupproducts.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.makeupproducts.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.makeupproducts[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.homeandkitchenproducts.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Home & kitchen'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Home & Kitchen'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.homeandkitchenproducts.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.homeandkitchenproducts.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    controller.homeandkitchenproducts.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.homeandkitchenproducts[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.skinAndHair.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Skin & Hair Products'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products, parameters: {
                                'category': 'Skin & Hair Products'
                              });
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.skinAndHair.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.skinAndHair.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.skinAndHair.length,
                                itemBuilder: (context, index) {
                                  final product = controller.skinAndHair[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.accessories.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Accessories'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Accessories'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.accessories.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.accessories.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.accessories.length,
                                itemBuilder: (context, index) {
                                  final product = controller.accessories[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.personalService.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal Services'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products, parameters: {
                                'category': 'Personal Services'
                              });
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.personalService.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.personalService.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.personalService.length,
                                itemBuilder: (context, index) {
                                  final product =
                                      controller.personalService[index];
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
                            );
                          }
                        },
                      ),
                    ),
              // Gap(20),
              controller.perfumes.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Perfumes'.tr,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.products,
                                  parameters: {'category': 'Perfumes'});
                            },
                            child: Text(
                              'See all'.tr,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
              controller.perfumes.isEmpty
                  ? Container()
                  : SizedBox(
                      height: 290,
                      child: Obx(
                        () {
                          if (controller.perfumes.isEmpty) {
                            return Center(
                              child: Text(
                                  'No products found for this category.'.tr),
                            );
                          } else {
                            return Container(
                              alignment: Alignment.centerLeft,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: controller.perfumes.length,
                                itemBuilder: (context, index) {
                                  final product = controller.perfumes[index];
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
                            );
                          }
                        },
                      ),
                    ),
              Gap(20),
            ]),
          ),
        ),
      ),
    );
  }
}

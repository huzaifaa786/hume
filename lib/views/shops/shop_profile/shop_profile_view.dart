// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/loading_widget.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/routes/app_routes.dart';

import 'package:hume/utils/colors.dart';
import 'package:hume/views/shops/shop_profile/shop_profile_controller.dart';

class ShopProfileView extends StatelessWidget {
  const ShopProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopProfileController>(
      builder: (controller) => controller.shop != null
          ? Scaffold(
              appBar: AppBar(
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: mainColor,
                      size: 26,
                    ),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: CachedNetworkImageProvider(
                            controller.shop!.logoImageUrl!),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.shop!.name!,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: appbarText),
                        ),
                        Text(
                          controller.shop!.category!,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ]),
                ]),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(20),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.25,
                        child: CachedNetworkImage(
                          imageUrl: controller.shop!.bannerImageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Shop details',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                      ),
                      Gap(7),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(controller.shop!.description!),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Our products',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: SizedBox(
                          height: 290,
                          width: Get.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.products.length,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                    name: controller.products[index].name,
                                    price: controller.products[index].price,
                                    img: controller.products[index].images![0],
                                    ontap: () {
                                      Get.toNamed(AppRoutes.productDeatil,
                                          parameters: {
                                            'id': controller.products[index].id
                                          });
                                    });
                              }),
                        ),
                      ),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Divider(),
                      ),
                      Gap(10),
                      Center(
                        child: SvgPicture.asset('assets/images/logo.svg',
                            height: 30, width: 30),
                      ),
                      Gap(50),
                    ],
                  ),
                ),
              ))
          : LoadingWidget(text: 'Loading...'),
    );
  }
}

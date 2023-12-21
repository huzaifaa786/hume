// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/product_card.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/shops/shop_profile/shop_profile_controller.dart';

class ShopProfileView extends GetView<ShopProfileController> {
  const ShopProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.arrow_back_ios_new_rounded,
              color: mainColor,
              size: 26,
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/50x50'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trendy Fashion',
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: appbarText),
                  ),
                  Text(
                    'Clothes brand',
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
                  child: CachedNetworkImage(
                    imageUrl: 'https://via.placeholder.com/420x280',
                  ),
                ),
                Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Shop details',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                ),
                Gap(7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                      'Trendy Fashion is a clothing brand started on 2022 , we desigen all our piecess to make you feel confident and trendy!'),
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
        ));
  }
}

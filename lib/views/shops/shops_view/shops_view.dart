// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:hume/models/shop.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/shops/shops_view/card.dart';
import 'package:hume/views/shops/shops_view/contact_button.dart';
import 'package:hume/views/shops/shops_view/shops_controller.dart';

class ShopsView extends GetView<ShopsController> {
  const ShopsView({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: LayoutScaffold(
          appBarTitle: 'Hume Shops'.tr,
          hasBottomNav: true,
          body: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount:
                        controller.shops.length, // Creating 6 identical cards
                    itemBuilder: (context, index) {
                      Shop shop = controller.shops[index];
                      return SalesListCard(
                        img: shop.logoImageUrl,
                        name: shop.name,
                        category: shop.category,
                        ontap: () {
                          Get.toNamed(AppRoutes.shop_profile, parameters: {
                            'shop_id': shop.id,
                          })!
                              .then((value) {
                            controller.shops = <Shop>[].obs;
                            controller.lastDocument = null;
                            controller.update();
                            controller.fetchShops();
                          });
                        },
                      );
                    },
                  ),
                ),
                // Image.asset('assets/images/h.png')
                SizedBox(height: 30),
                SvgPicture.asset('assets/images/h.svg'),
                SizedBox(height: 30),
                Text(
                  "Do you have a Shop?".tr,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: appbarText,
                    height: 24 / 16,
                  ),
                  textAlign: TextAlign.center,
                ) ,
                Container(
                  width: Get.width * 0.75,
                  child: Text(
                    "contact us to join our parteners and sell your products faster!".tr
                    ,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      // height: 28 / 12,
                    ),
                    textAlign: TextAlign.center,
                  ) ,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContactButton(
                      img: 'assets/images/email.svg',
                      text: 'Email'.tr,
                      ontap: () {
                        controller.sendMail();
                      },
                    ),
                    ContactButton(
                      img: 'assets/images/phone.svg',
                      text: 'Phone'.tr,
                      ontap: () {
                        controller.callNumber();
                      },
                    ),
                    ContactButton(
                      img: 'assets/images/whatsapp.svg',
                      text: 'Whatsapp'.tr,
                      ontap: () {
                        controller.whatsapp(
                            '+923466363116', 'Hi I need your help');
                      },
                    )
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          )),
    );
  }
}

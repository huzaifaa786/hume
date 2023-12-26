// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    return LayoutScaffold(
        appBarTitle: 'Hume Shops',
        body: SingleChildScrollView(
          controller:controller.scrollController,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 6, // Creating 6 identical cards
                itemBuilder: (context, index) {
                  return SalesListCard(
                    img: 'https://via.placeholder.com/150',
                    name: 'Trendy Fashion',
                    category: 'Clothes brand',
                    ontap: () {
                      Get.toNamed(AppRoutes.shop_profile);
                    },
                  );
                },
              ),
              // Image.asset('assets/images/h.png')
              SizedBox(height: 30),
              SvgPicture.asset('assets/images/h.svg'),
              SizedBox(height: 30),
              Text(
                "Do you have a Shop?",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: appbarText,
                  height: 24 / 16,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: Get.width * 0.75,
                child: Text(
                  "contact us to join our parteners and sell your products faster!",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    // height: 28 / 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContactButton(
                    img: 'assets/images/email.svg',
                    text: 'Email',
                    ontap: () {},
                  ),
                  ContactButton(
                    img: 'assets/images/phone.svg',
                    text: 'Phone',
                    ontap: () {},
                  ),
                  ContactButton(
                    img: 'assets/images/whatsapp.svg',
                    text: 'Whatsapp',
                    ontap: () {},
                  )
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ));
  }
}

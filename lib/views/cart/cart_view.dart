// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/cart/cart_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:input_quantity/input_quantity.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'My cart',
        hasBottomNav: true,
        bottomNav: Padding(
          padding: const EdgeInsets.all(15.0),
          child: HumeButton(
            title: 'Checkout',
            hasIcon: true,
            iconSvgPath: 'assets/images/money.svg',
            onPressed: () {
              Get.toNamed(AppRoutes.checkout);
            },
          ),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 2, // Creating 6 identical cards
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                            child: CachedNetworkImage(
                              imageUrl: 'https://via.placeholder.com/160x220',
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 10),
                                      width: Get.width * 0.4,
                                      child: Text(
                                        'Plaid Flap Pocket Drop Shoulder Coat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 25),
                                child: Text('Size: M',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 65),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.25),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: InputQty(
                                          decoration: QtyDecorationProps(
                                              minusBtn: SvgPicture.asset(
                                                  'assets/images/minus.svg'),
                                              plusBtn: SvgPicture.asset(
                                                  'assets/images/plus.svg'),
                                              isBordered: false,
                                              borderShape:
                                                  BorderShapeBtn.circle,
                                              width: 12)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('250 AED',
                                          style: TextStyle(
                                              fontSize: Get.width * 0.038,
                                              fontWeight: FontWeight.w600,
                                              color: litePurple)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(7),
                      Divider()
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}

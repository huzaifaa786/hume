// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/cart/cart_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/components/input_field.dart';
import 'package:input_quantity/input_quantity.dart';

class CheckoutView extends GetView<CartController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'Checkout',
      hasBottomNav: true,
      bottomNav: Padding(
        padding: const EdgeInsets.all(15.0),
        child: HumeButton(
          title: 'Confirm purchase',
          hasIcon: true,
          iconSvgPath: 'assets/images/confirm_cart.svg',
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
                child: Column(
              children: [
                Gap(10),
                InputField(
                  hint: 'Enter name',
                  hasTitle: true,
                  title: 'Name',
                ),
                Gap(15),
                InputField(
                  hint: 'Enter phone',
                  hasTitle: true,
                  title: 'Phone',
                ),
                Gap(15),
                InputField(
                  hint: 'Enter address',
                  hasTitle: true,
                  title: 'Address',
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Products(5)',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ],
                ),
                Gap(10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 5, // Creating 6 identical cards
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              child: CachedNetworkImage(
                                imageUrl: 'https://via.placeholder.com/100x100',
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.63,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(
                                              left: 15, top: 10),
                                          width: Get.width * 0.55,
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
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.25),
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
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
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
                            ),
                          ],
                        ),
                        Gap(7),
                        Divider()
                      ],
                    );
                  },
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
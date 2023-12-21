// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/product_deatil/product_detail_controller.dart';
import 'package:hume/views/product_deatil/top_card.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      appBarTitle: 'Product details',
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductProfileCardCard(),
            Gap(12),
            Image.asset('assets/images/product.png',
                width: Get.width, height: Get.height * 0.5, fit: BoxFit.cover),
            Container(
              width: Get.width,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: Get.width * 0.5),
                        child: Text(
                          "Plaid Flap Pocket Drop Shoulder Coat",
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        "250 AED",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Gap(6),
                  Text(
                    'Plaid Flap Pocket Drop Shoulder Coat Plaid Flap Pocket Drop Shoulder Coat Plaid Flap Pocket Drop Shoulder Coat',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "1",
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: appbarText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Qty",
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "250 AED",
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: appbarText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Total price",
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      HumeButton(
                        title: 'Add to cart',
                        onPressed: () {},
                        buttonHeight: 45.0,
                        hasIcon: true,
                        fontSize: 12.0,
                      )
                    ],
                  ),
                  Gap(8),
                  Text(
                    "Size",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(8),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: containerBg,
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(child: Text('XL')),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: containerBg,
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(child: Text('L')),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: containerBg,
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(child: Text('M')),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: containerBg,
                            borderRadius: BorderRadius.circular(45)),
                        child: Center(child: Text('S')),
                      ),
                    ],
                  ),
                  Gap(8),
                  Text(
                    "Quantity",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(20)),
                        child: InputQty(
                            decoration: QtyDecorationProps(
                                minusBtn:
                                    SvgPicture.asset('assets/images/minus.svg'),
                                plusBtn:
                                    SvgPicture.asset('assets/images/plus.svg'),
                                isBordered: false,
                                borderShape: BorderShapeBtn.circle,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

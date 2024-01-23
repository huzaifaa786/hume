// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/components/button.dart';
import 'package:hume/models/combined_data.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/ui_utils.dart';
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
        hasBottomNav: false,
        bottomNav: Padding(
          padding: const EdgeInsets.all(15.0),
          child: HumeButton(
            title: 'Checkout (' + controller.totalAmount.toString() + ' AED)',
            hasIcon: true,
            iconSvgPath: 'assets/images/money.svg',
            onPressed: () {
              Get.toNamed(AppRoutes.checkout);
            },
          ),
        ),
        body: SafeArea(
          child: controller.cartItems.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                        future: ProductApi().fetchProductById(
                            controller.cartItems[index].productId),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: Text(''),
                            );
                          }
                          ProductShopCombined shopCombined = snapshot.data!;
                          return Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the radius as needed
                                        child: CachedNetworkImage(
                                          imageUrl: shopCombined
                                              .product.images!.first,
                                          width: 130,
                                          height: 220,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  width: Get.width * 0.4,
                                                  child: Text(
                                                    shopCombined.product.name!,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              InkWell(
                                                onTap: () {
                                                  UiUtilites.confirmAlert(
                                                      context,
                                                      'Remove ' +
                                                          shopCombined
                                                              .product.name! +
                                                          " from cart", () {
                                                    controller.removeProduct(
                                                        controller
                                                            .cartItems[index]
                                                            .productId,
                                                        controller
                                                                    .cartItems[
                                                                        index]
                                                                    .size !=
                                                                ''
                                                            ? controller
                                                                .cartItems[
                                                                    index]
                                                                .size
                                                            : null);
                                                  }, () {
                                                    Get.back();
                                                  }, "Remove", "Cancel");
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                          controller.cartItems[index].size != ''
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0, top: 25),
                                                  child: Text(
                                                      'Size: ' +
                                                          controller
                                                              .cartItems[index]
                                                              .size!,
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      )),
                                                )
                                              : Text(''),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, top: 65),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey
                                                          .withOpacity(0.25),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: InputQty.int(
                                                      initVal: controller
                                                          .cartItems[index]
                                                          .quantity,
                                                      minVal: 1,
                                                      qtyFormProps:
                                                          QtyFormProps(
                                                              enableTyping:
                                                                  false),
                                                      onQtyChanged: (value) {
                                                        controller.updateCart(
                                                            controller
                                                                .cartItems[
                                                                    index]
                                                                .productId,
                                                            controller
                                                                        .cartItems[
                                                                            index]
                                                                        .size !=
                                                                    ''
                                                                ? controller
                                                                    .cartItems[
                                                                        index]
                                                                    .size
                                                                : null,
                                                            value);
                                                        controller.update();
                                                      },
                                                      decimalPlaces: 0,
                                                      decoration: QtyDecorationProps(
                                                          minusBtn:
                                                              SvgPicture.asset(
                                                                  'assets/images/minus.svg'),
                                                          plusBtn: SvgPicture.asset(
                                                              'assets/images/plus.svg'),
                                                          isBordered: false,
                                                          borderShape:
                                                              BorderShapeBtn
                                                                  .circle,
                                                          width: 12)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                      controller
                                                              .cartItems[index]
                                                              .total
                                                              .toString() +
                                                          ' AED',
                                                      style: TextStyle(
                                                          fontSize:
                                                              Get.width * 0.038,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                        });
                  },
                )
              : SizedBox(
                  height: Get.height * 0.8,
                  child: Center(
                    child: Text('No products found!'),
                  )),
        ),
      ),
    );
  }
}

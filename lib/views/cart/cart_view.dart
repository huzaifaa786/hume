// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    GetStorage box = GetStorage();
    return GetBuilder<CartController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.ltr,
        child: LayoutScaffold(
          appBarTitle: 'My cart'.tr,
          hasBottomNav: false,
          bottomNav: controller.cartItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: HumeButton(
                    title: 'Checkout'.tr +
                        ' (' +
                        controller.totalAmount.toString() +
                        'AED'.tr +
                        ')',
                    hasIcon: true,
                    iconSvgPath: 'assets/images/money.svg',
                    onPressed: () {
                      Get.toNamed(AppRoutes.checkout);
                    },
                  ),
                )
              : SizedBox(),
          body: Directionality(
            textDirection: box.read('locale') == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
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
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                imageUrl: shopCombined
                                                    .product.images!.first,
                                                width: 130,
                                                height: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 160,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15,
                                                                top: 10),
                                                        width: Get.width * 0.4,
                                                        child: Text(
                                                          shopCombined
                                                              .product.name!,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        )),
                                                    InkWell(
                                                      onTap: () {
                                                        UiUtilites.confirmAlert(
                                                            context,
                                                            'Remove '.tr +
                                                                shopCombined
                                                                    .product
                                                                    .name! +
                                                                " from cart".tr,
                                                            () {
                                                          controller.removeProduct(
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
                                                                  : null);
                                                        }, () {
                                                          Get.back();
                                                        }, "Remove ".tr,
                                                            "Cancel".tr);
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.grey,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                controller.cartItems[index]
                                                            .size!.isNotEmpty ||
                                                        controller
                                                            .cartItems[index]
                                                            .shoeSize!
                                                            .isNotEmpty
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 20.0,
                                                          right: 20.0,
                                                        ),
                                                        child: Text(
                                                            'Size: '.tr +
                                                                controller
                                                                    .cartItems[
                                                                        index]
                                                                    .size! +
                                                                ' ' +
                                                                controller
                                                                    .cartItems[
                                                                        index]
                                                                    .shoeSize!,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      )
                                                    : Text(''),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10.0,
                                                    right: 10.0,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.25),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: InputQty.int(
                                                            initVal: controller
                                                                .cartItems[
                                                                    index]
                                                                .quantity,
                                                            minVal: 1,
                                                            qtyFormProps:
                                                                QtyFormProps(
                                                                    enableTyping:
                                                                        false),
                                                            onQtyChanged:
                                                                (value) {
                                                              controller.updateCart(
                                                                  controller
                                                                      .cartItems[
                                                                          index]
                                                                      .productId,
                                                                  controller.cartItems[index].size !=
                                                                          ''
                                                                      ? controller
                                                                          .cartItems[
                                                                              index]
                                                                          .size
                                                                      : null,
                                                                  value);
                                                              controller
                                                                  .update();
                                                            },
                                                            decimalPlaces: 0,
                                                            decoration: QtyDecorationProps(
                                                                minusBtn:
                                                                    SvgPicture
                                                                        .asset(
                                                                            'assets/images/minus.svg'),
                                                                plusBtn: SvgPicture
                                                                    .asset(
                                                                        'assets/images/plus.svg'),
                                                                isBordered:
                                                                    false,
                                                                borderShape:
                                                                    BorderShapeBtn
                                                                        .circle,
                                                                width: 12)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8.0,
                                                                right: 8.0),
                                                        child: Text(
                                                            controller.cartItems[index].total
                                                                    .toString() +
                                                                'AED'.tr,
                                                            style: TextStyle(
                                                                fontSize:
                                                                    Get.width *
                                                                        0.038,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    litePurple)),
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
                                  ));
                            });
                      },
                    )
                  : SizedBox(
                      height: Get.height * 0.8,
                      child: Center(
                        child: Directionality(
                            textDirection: box.read('locale') == 'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: Text('No products found!'.tr + '!')),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}

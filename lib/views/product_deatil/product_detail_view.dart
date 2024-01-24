// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
 import 'package:hume/components/button.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/layout/layout_screen.dart';
import 'package:hume/views/product_deatil/product_detail_controller.dart';
import 'package:hume/views/product_deatil/top_card.dart';
import 'package:input_quantity/input_quantity.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      autoRemove: false,
      builder: (controller) => Directionality(textDirection: TextDirection.ltr,
        child: LayoutScaffold(
          appBarTitle: 'Product details'.tr,
          body: controller.combinedProductData != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductProfileCardCard(
                        ontap: () {
                          Get.toNamed(AppRoutes.shop_profile, parameters: {
                            'shop_id': controller.combinedProductData!.shop.id,
                          });
                        },
                        img: controller.combinedProductData!.shop.logoImageUrl,
                        name: controller.combinedProductData!.shop.name,
                        category: controller.combinedProductData!.shop.category,
                      ),
                      Gap(12),
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       controller.combinedProductData!.product.images![0],
                      //   height: Get.height * 0.5,
                      //   width: Get.width,
                      //   fit: BoxFit.cover,
                      // ),
                      SizedBox(
                        height: Get.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            autoPlay: true,
                            viewportFraction: 1,
                            aspectRatio: 16 / 16,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              controller.setCurrentIndex(index);
                            },
                          ),
                          items: controller.combinedProductData!.product.images!
                              .map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: Get.width * 0.9,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: i,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress)),
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
                        count: controller
                            .combinedProductData!.product.images!.length,
                        index: controller.currentIndex,
                        activeColor: mainColor,
                        color: Colors.grey,
                        width: 6,
                      ),
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
                                  constraints:
                                      BoxConstraints(maxWidth: Get.width * 0.5),
                                  child: Text(
                                    controller.combinedProductData!.product.name!,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "${controller.combinedProductData!.product.price}"+"AED".tr,
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
                              controller.combinedProductData!.product.description
                                  .toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ) ,
                            Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      controller.qty.toString(),
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: appbarText,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Qty".tr,
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
                                      controller.total.toString() + "AED".tr,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: appbarText,
                                      ),
                                      textAlign: TextAlign.center,
                                    ) ,
                                    Text(
                                      "Total price".tr,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ) ,
                                  ],
                                ),
                                HumeButton(
                                  title: 'Add to cart'.tr,
                                  onPressed: () {
                                    controller.addToCart();
                                  },
                                  buttonHeight: 45.0,
                                  hasIcon: true,
                                  fontSize: 12.0,
                                )
                              ],
                            ),
                            Gap(8),
                            controller.selectedSize != ''
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Size".tr,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ) ,
                                      Gap(8),
                                      SizedBox(
                                        height: Get.height * 0.045,
                                        width: Get.width,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .combinedProductData!
                                              .product
                                              .sizes!
                                              .length,
                                          itemBuilder: (context, index) {
                                            String size = controller
                                                .combinedProductData!
                                                .product
                                                .sizes![index];
                                            bool isSelected =
                                                size == controller.selectedSize;
        
                                            return GestureDetector(
                                              onTap: () {
                                                controller.selectedSize = size;
                                                controller.update();
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                margin: EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? mainColor
                                                      : containerBg,
                                                  borderRadius:
                                                      BorderRadius.circular(45),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    size,
                                                    style: TextStyle(
                                                      color: isSelected
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ) ,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(''),
                            Gap(8),
                            Text(
                              "Quantity".tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ) ,
                            Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: InputQty.int(
                                      initVal: 1,
                                      minVal: 1,
                                      qtyFormProps:
                                          QtyFormProps(enableTyping: false),
                                      onQtyChanged: (value) {
                                        controller.qty = value;
                                        controller.total = controller.qty *
                                            int.parse(controller
                                                .combinedProductData!
                                                .product
                                                .price!);
                                        controller.update();
                                      },
                                      decimalPlaces: 0,
                                      decoration: QtyDecorationProps(
                                          minusBtn: SvgPicture.asset(
                                              'assets/images/minus.svg'),
                                          plusBtn: SvgPicture.asset(
                                              'assets/images/plus.svg'),
                                          isBordered: false,
                                          borderShape: BorderShapeBtn.circle,
                                          width: 12)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                          controller.total.toString() + "AED".tr,
                                          style: TextStyle(
                                              fontSize: Get.width * 0.038,
                                              fontWeight: FontWeight.w600,
                                              color: litePurple))
                                       ,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}

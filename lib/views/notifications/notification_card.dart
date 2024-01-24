// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
 import 'package:hume/utils/colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.date,
      required this.ontap,
      required this.shopName,
      required this.content,
      required this.orderId});

  final date;
  final content;
  final ontap;
  final orderId;
  final shopName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: containerBg,
            border: Border.all(
                color: Color(0xFF000000).withOpacity(0.1), width: 0.5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: Get.width * 0.6),
                      child: Text(
                        content == 'Accepted order'
                            ? 'Accepted order!'
                            : content == 'Deliverd order'
                                ? 'Your order is delivred !'
                                : 'Rejected order! ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: content == 'Accepted order'
                                ? acceptedColor
                                : content == 'Deliverd order'
                                    ? deliverColor
                                    : rejectedColor),
                      ) ,
                    ),
                    content == 'Accepted order'
                        ? SvgPicture.asset('assets/images/checked_yellow.svg')
                        : content == 'Deliverd order'
                            ? SvgPicture.asset('assets/images/delivered.svg')
                            : SvgPicture.asset('assets/images/rejected.svg'),
                  ],
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF451E5D)),
                ) 
              ],
            ),
            Gap(27),
            InkWell(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/shopping_bags.svg',
                                width: 16,
                                height: 11,
                              ),
                              Gap(10),
                              Text(
                                orderId,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.6)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/shops.svg',
                                color: litePurple,
                                height: 14,
                                width: 16,
                              ),
                              Gap(10),
                              Text(
                                shopName,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: litePurple),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('See order details',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: litePurple))
                               ,
                          Gap(10),
                          SvgPicture.asset('assets/images/ion_chevron-back.svg')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

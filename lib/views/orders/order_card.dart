// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume/utils/colors.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key, this.id, this.status = 1, this.ontap, this.date, this.price});
  final id;
  final price;
  final date;
  final ontap;
  final status;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(left: 8, right: 8, top: 12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(color: Colors.grey[300]!, blurRadius: 14, spreadRadius: 4),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.5,
                child: Text(
                  status == '0'
                      ? 'In progress'
                      : status == '1'
                          ? 'Accepted order'
                          : status == '2'
                              ? 'Rejected order'
                              : 'Delivered order',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: status == '0'
                        ? Colors.amber
                        : status == '1'
                            ? acceptedColor
                            : status == '2'
                                ? rejectedColor
                                : deliverColor,
                  ),
                ).translate(),
              ),
              InkWell(
                onTap: ontap,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      color: containerBg,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "See products",
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: litePurple,
                    ),
                  ).translate(),
                ),
              ),
            ],
          ),
          Gap(6),
          Text(
            "Order No. $id",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ).translate(),
          Gap(8),
          Row(
            children: [
              Text(
                "Requested   ",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: hintColor,
                ),
              ).translate(),
              Text(
                "$date",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7b6c84),
                ),
              ).translate()
            ],
          ),
          Gap(20),
          Row(
            children: [
              Text(
                "Total price   ",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: hintColor,
                ),
              ).translate(),
              Text(
                "$price AED",
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: litePurple,
                ),
              ).translate()
            ],
          ),
          Gap(10)
        ],
      ),
    );
  }
}

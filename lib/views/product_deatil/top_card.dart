// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
 import 'package:hume/utils/colors.dart';

class ProductProfileCardCard extends StatelessWidget {
  const ProductProfileCardCard(
      {super.key, this.ontap, this.img, this.name, this.category});
  final name;
  final category;
  final img;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // decoration: BoxDecoration(
      //   // color: containerBg,
      //   borderRadius: BorderRadius.circular(43)
      // ),
      margin: EdgeInsets.only(left: 15, right: 15),
      // padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(img),
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: Get.width * 0.4,
                              minWidth: Get.width * 0.1),
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Get.width * 0.037,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              color: appbarText,
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/images/approved.svg')
                      ],
                    ),
                    Text(
                      category,
                      style: TextStyle(
                          fontSize: Get.width * 0.03,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              width: 100,
              height: 35,
              decoration: ShapeDecoration(
                color: containerBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(43),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'view shop',
                      style: TextStyle(
                        color: appbarText,
                        fontSize: Get.width * 0.03,
                        fontWeight: FontWeight.w700,
                      ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          size: Get.width * 0.035, color: appbarText),
                      // child: SvgPicture.asset('assets/images/approved.svg'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class SalesListCard extends StatelessWidget {
  const SalesListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: containerBg,
        borderRadius: BorderRadius.circular(43)
      ),
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
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
                            'Trendy Fashion',
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
                      'data',
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
          Container(
            width: 100,
            height: 35,
            decoration: ShapeDecoration(
              color: white,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(Icons.arrow_forward_ios_rounded,
                        size: Get.width * 0.035, color: appbarText),
                    // child: SvgPicture.asset('assets/images/approved.svg'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
 import 'package:hume/utils/colors.dart';

class CategoryCircle extends StatelessWidget {
  const CategoryCircle(
      {super.key, required this.imagePath, required this.title, this.ontap});
  final String imagePath;
  final String title;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(right: 15),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 5,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              )),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: mainColor, fontSize: 12, fontWeight: FontWeight.w600),
            ) ,
          )
        ],
      ),
    );
  }
}

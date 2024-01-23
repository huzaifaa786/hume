// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:hume/utils/colors.dart';

class CategoryCard2 extends StatelessWidget {
  const CategoryCard2(
      {super.key,
      this.name,
      this.img,
      this.ontap,
      this.height,
      this.width = 0.9});
  final ontap;
  final img;
  final name;
  final height;
  final width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: Get.height * 0.22,
        width: Get.width,
        color: categoryColor.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // height: 38 / 20,
              ),
              textAlign: TextAlign.left,
            ) ,
            Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage(img),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * height,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }
}

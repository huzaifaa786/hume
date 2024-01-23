// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:hume/utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      this.name,
      this.img,
      this.ontap,
      this.height,
      this.fit = BoxFit.cover,
      this.width = 0.4});
  final ontap;
  final img;
  final name;
  final height;
  final width;
  final fit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: Get.height * 0.22,
            color: categoryColor.withOpacity(0.5),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image: AssetImage(img),
                  width: MediaQuery.of(context).size.width * width,
                  height: MediaQuery.of(context).size.height * height,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              left: 12,
              top: 8,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // height: 38 / 20,
                ),
                textAlign: TextAlign.left,
              ) )
        ],
      ),
    );
  }
}

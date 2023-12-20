// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class HumeButton extends StatelessWidget {
  const HumeButton({
    super.key,
    @required this.title,
    this.buttonWidth = 0.35,
    @required this.onPressed,
  });
  final title;
  final buttonWidth;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * buttonWidth,
      height: 60,
      decoration: ShapeDecoration(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(43),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

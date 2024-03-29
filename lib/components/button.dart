// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
 import 'package:hume/utils/colors.dart';

class HumeButton extends StatelessWidget {
  const HumeButton({
    super.key,
    @required this.title,
    this.buttonWidth = 0.35,
    this.buttonHeight = 60.0,
    this.fontSize = 18.0,
    this.color = mainColor,
    this.hasIcon = false,
    this.iconSvgPath = 'assets/images/cart.svg',
    @required this.onPressed,
  });
  final title;
  final color;
  final buttonHeight;
  final fontSize;
  final buttonWidth;
  final onPressed;
  final hasIcon;
  final iconSvgPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Get.width * buttonWidth,
        height: buttonHeight,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(43),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasIcon)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    iconSvgPath,
                    color: white,
                  ),
                ),
              Text(
                title,
                style: TextStyle(
                  color: white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ) ,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hume/utils/colors.dart';

class GuestTopbar extends StatelessWidget {
  const GuestTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_new_rounded, color: mainColor, size: 30,)),
          SvgPicture.asset('assets/images/dots.svg')
        ]),
    );
  }
}
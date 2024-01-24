// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:hume/utils/colors.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, this.img, this.text,this.ontap});
  final img;
  final text;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100]!, spreadRadius: 8, blurRadius: 12),
              ],
            ),
            child: SvgPicture.asset(
              img,
              fit: BoxFit.scaleDown,
              height: 40,
              width: 40,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
              height: 15 / 13,
            ),
            textAlign: TextAlign.center,
          ) 
        ],
      ),
    );
  }
}

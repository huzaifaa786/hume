// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:hume/utils/colors.dart';

class UiUtilites {
  static errorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: white,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successSnackbar(String message, String title) {
    Get.snackbar(
      title,
      message,
      backgroundColor: mainColor,
      // backgroundGradient: const LinearGradient(
      //   colors: [borderDown, borderTop],
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      // ),
      colorText: white,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static successAlert(context,title) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.transparent, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.01),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(12, 15),
                      color: Colors.black),
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(12, -15),
                      color: Colors.black),
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(-12, 15),
                      color: Colors.black),
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset(-12, -15),
                      color: Colors.black)
                ],
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Gap(40),
                  Image.asset('assets/images/Approve_Badge.png',
                      height: 50, width: 50),
                  Gap(10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      // height: 52 / 12,
                    ),
                    textAlign: TextAlign.center,
                  ).translate(),
                  Gap(40),
                ],
              ),
            ),
          );
        });
  }

   static confirmAlert(context, title,onPressOK,onPressCancel,textOk,textCancel) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.transparent, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(35.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  color: white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Gap(30),
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: litePurple
                      
                        // height: 52 / 12,
                      ),
                      textAlign: TextAlign.center,
                    ).translate(),
                    Gap(10),
                    Divider(
                      height: 1,
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: onPressCancel,
                          child: Text(
                            textCancel,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              
                            ),
                          ).translate(),
                        ),
                        InkWell(
                          onTap: onPressOK,
                          child: Text(
                            textOk,
                           
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ).translate(),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

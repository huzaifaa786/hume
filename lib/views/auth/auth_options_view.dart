// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/outline_button.dart';
import 'package:hume/utils/colors.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(60),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/logo.svg',
                      height: 30, width: 50),
                  Gap(30),
                  OutlineButton(title: 'continue with email', onPressed: (){},icon: Icons.mail,),
                    Gap(15),
                  OutlineButton(
                    title: 'continue with apple',
                    onPressed: () {},
                    icon: Icons.apple,
                  ),
                   Gap(15),
                  OutlineButton(
                    title: 'continue with google',
                    onPressed: () {},
                    icon: Icons.apple,
                  ),
                  Gap(15),
                  OutlineButton(
                    title: 'continue with OTP',
                    onPressed: () {},
                    icon: Icons.key_sharp,
                  )
                ],
              ),
            ),
            // Gap(30),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/ladies.jpg',
                            ))),
                    width: Get.width,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              mainColor.withOpacity(0.8),
                              Colors.transparent
                            ]),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

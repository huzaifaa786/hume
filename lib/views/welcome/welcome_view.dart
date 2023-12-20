// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/utils/colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(100),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 55),
                  ),
                  SvgPicture.asset('assets/images/logo.svg',
                      height: 30, width: 50),
                  Gap(30),
                  Text(
                    'all what you need in one place with fast and safe online shopping  experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: greyText),
                  ),
                  Gap(40),
                  HumeButton(
                    title: 'Sign up',
                    onPressed: () {},
                    buttonWidth: 0.85,
                  ),
                  Gap(20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Already have an account?  ',
                      style: TextStyle(color: greyText),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    )
                  ]),
                ],
              ),
            ),
            // Gap(30),
            Expanded(child: Container(
               decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/ladies.jpg',))),
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
              )
              ))
          ],
        ),
      ),
    );
  }
}

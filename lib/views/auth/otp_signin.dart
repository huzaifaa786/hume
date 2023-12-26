// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/guest_topbar.dart';
import 'package:hume/components/input_field.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/ui_utils.dart';
import 'package:hume/views/auth/auth_controller.dart';

class OtpSignin extends StatelessWidget {
  const OtpSignin({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        autoRemove: false,
        builder: (controller) => Scaffold(
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SvgPicture.asset('assets/images/dots.svg'),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Column(
                  children: [
                    GuestTopbar(),
                    Gap(50),
                    Column(
                      children: [
                        Row(
                          children: [
                            Gap(20),
                            Text(
                              'Enter your phone number \n to get an OTP code',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor),
                            ),
                          ],
                        ),
                        Gap(46),
                        InputField(
                          hint: 'phone number',
                          controller: controller.forgetPasswordMail,
                          color: mainColor,
                        ),
                        Gap(38),
                        HumeButton(
                          title: 'Send code',
                          onPressed: controller.areForgetFieldsFilled.value
                              ? () {
                                  controller.forgotPassword();
                                }
                              : () {
                                  UiUtilites.errorSnackbar(
                                      'Fill out all fields',
                                      'Please fill all above fields');
                                },
                          buttonWidth: 0.85,
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ));
  }
}

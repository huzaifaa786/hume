// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/guest_topbar.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/ui_utils.dart';
import 'package:hume/views/auth/auth_controller.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
                              'Enter your phone number \n to get an OTP code'.tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: mainColor),
                            ) ,
                          ],
                        ),
                        Gap(46),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 90,
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              fillColor: containerBg,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            languageCode: "en",
                            onChanged: (phone) {
                              if (countries
                                      .firstWhere((element) =>
                                          element.code == phone.countryISOCode)
                                      .maxLength ==
                                  phone.number.length) {
                                controller.phone = phone.number;
                                controller.completePhone = phone.completeNumber;
                              } else {
                                controller.completePhone = '';
                              }
                            },
                          ),
                        ),
                        Gap(38),
                        HumeButton(
                          title: 'Send code'.tr,
                          onPressed: controller.completePhone == ''
                              ? () {
                                  UiUtilites.errorSnackbar(
                                      'Fill out all fields'.tr,
                                      'Please fill all above fields'.tr);
                                }
                              : () {
                                  controller.sendTokenforSignUP();
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/input_field.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/controller_initlization.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      autoRemove: false,
      builder: (controller) => LayoutScaffold(
        appBarTitle: 'My account',
        ontap: () {
          controller.logout();
        },
        hasLogout: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: containerBg,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width * 0.4,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/user_profile.svg'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width * 0.25,
                                      child: Text(
                                        'User name',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.25,
                                      child: Text(
                                        '@username',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13, color: greyText),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Gap(20),
                          HumeButton(
                            title: 'My orders',
                            buttonWidth: 0.4,
                            buttonHeight: 45.0,
                            color: litePurple,
                            fontSize: 14.0,
                            onPressed: () {},
                            hasIcon: true,
                            iconSvgPath: 'assets/images/orders-icon.svg',
                          )
                        ],
                      ),
                      Gap(15),
                      SvgPicture.asset('assets/images/amico.svg')
                    ]),
                  ),
                  Gap(10),
                  Divider(),
                  Gap(10),
                  InputField(
                    hint: 'Enter username',
                    hasTitle: true,
                    title: 'username',
                  ),
                  Gap(10),
                  InputField(
                    hint: 'Enter phone number',
                    hasTitle: true,
                    title: 'Phone number',
                  ),
                  Gap(10),
                  InputField(
                    hint: 'Enter email',
                    hasTitle: true,
                    title: 'Email',
                  ),
                  Gap(10),
                  InputField(
                    hint: 'Enter password',
                    hasTitle: true,
                    title: 'Password',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

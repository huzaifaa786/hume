// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/input_field.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/layout/layout_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      autoRemove: false,
      initState: (state) async {
        Future.delayed(Duration(milliseconds: 100), () {
          state.controller!.user.value == null
              ? state.controller!
                  .fetchUser(FirebaseAuth.instance.currentUser!.uid)
              : null;
        });
      },
      builder: (controller) => LayoutScaffold(
        hasBottomNav: true,
        appBarTitle: 'My account',
        ontap: () {
          //
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Are you sure!'),
                    content: Text('You want to logout?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text('No'),
                      ),
                      TextButton(
                          onPressed: () => controller.logout(),
                          child: Text('Yes'))
                    ],
                  ));
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
                          SizedBox(
                            width: Get.width * 0.4,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/user_profile.svg'),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.user.value != null
                                        ? SizedBox(
                                            width: Get.width * 0.25,
                                            child: Text(
                                              '${controller.user.value!.name}',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          )
                                        : SizedBox(
                                            width: Get.width * 0.25,
                                            child: Text(
                                              '',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                    // Container(
                                    //   width: Get.width * 0.25,
                                    //   child: Text(
                                    //     '@username',
                                    //     overflow: TextOverflow.ellipsis,
                                    //     style: TextStyle(
                                    //         fontSize: 13, color: greyText),
                                    //   ),
                                    // ),
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
                            onPressed: () {
                              Get.toNamed(AppRoutes.orders, parameters: {
                                'userId': controller.user.value!.id
                              });
                            },
                            hasIcon: true,
                            iconSvgPath: 'assets/images/orders-icon.svg',
                          )
                        ],
                      ),
                      Gap(15),
                      SvgPicture.asset(
                        'assets/images/amico.svg',
                        fit: BoxFit.scaleDown,
                        width: Get.width * 0.3,
                      )
                    ]),
                  ),
                  Gap(10),
                  Divider(),
                  Gap(10),
                  InputField(
                    hint: 'Enter username',
                    controller: controller.name,
                    hasTitle: true,
                    title: 'username',
                  ),
                  Gap(10),
                  InputField(
                    controller: controller.phone,
                    hint: 'Enter phone number',
                    readOnly: true,
                    hasTitle: true,
                    title: 'Phone number',
                  ),
                  controller.providerNames!.contains('phone') == true
                      ? Container()
                      : Column(
                          children: [
                            Gap(10),
                            InputField(
                              controller: controller.email,
                              readOnly: true,
                              hint: 'Enter email',
                              hasTitle: true,
                              title: 'Email',
                            ),
                          ],
                        ),
                  Gap(10),
                  controller.providerNames!.contains('password') == true
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.change_password);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, bottom: 15),
                                child: Text('Change password',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )
                          ],
                        )
                      : Container(),
                  HumeButton(
                    title: 'Update',
                    buttonWidth: 1.0,
                    buttonHeight: 45.0,
                    color: litePurple,
                    fontSize: 14.0,
                    onPressed: () {
                      controller.updateUsername();
                    },
                  ),
                  // InputField(
                  //   hint: 'Enter password',
                  //   hasTitle: true,
                  //   title: 'Password',
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

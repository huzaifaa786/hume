// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/input_field.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/views/account/account_controller.dart';
import 'package:hume/views/app_translate/translate.dart';
import 'package:hume/views/layout/layout_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  GetStorage box = GetStorage();
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
      builder: (controller) => Directionality(
        textDirection: TextDirection.ltr,
        child: LayoutScaffold(
          hasBottomNav: true,
          appBarTitle: 'My account'.tr,
          ontap: () {
            //
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text('Are you sure!'.tr),
                      content: Text('You want to logout?'.tr),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'.tr),
                          child: Text('No'.tr),
                        ),
                        TextButton(
                            onPressed: () async {
                              Get.updateLocale(const Locale('en', 'US'));
                              GetStorage box = GetStorage();
                              await box.write('locale', 'en');
                              box.read('locale');
                              setState(() {});
                              controller.logout();
                            },
                            child: Text('Yes'.tr))
                      ],
                    ));
          },
          hasLogout: true,
          body: Directionality(
            textDirection: box.read('locale') == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: SafeArea(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        controller.user.value != null
                                            ? SizedBox(
                                                width: Get.width * 0.25,
                                                child: Text(
                                                  '${controller.user.value!.name}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              )
                                            : SizedBox(
                                                width: Get.width * 0.25,
                                                child: Text(
                                                  '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w800),
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
                                title: 'My orders'.tr,
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
                        hint: 'Enter username'.tr,
                        controller: controller.name,
                        hasTitle: true,
                        title: 'Username'.tr,
                      ),
                      Gap(10),
                      controller.providerNames!.contains('google.com') == true
                          ? Container()
                          : InputField(
                              controller: controller.phone,
                              hint: 'Enter phone number'.tr,
                              readOnly: true,
                              hasTitle: true,
                              title: 'Phone number'.tr,
                            ),
                      controller.providerNames!.contains('phone') == true
                          ? Container()
                          : Column(
                              children: [
                                Gap(10),
                                InputField(
                                  controller: controller.email,
                                  readOnly: true,
                                  hint: 'Enter email'.tr,
                                  hasTitle: true,
                                  title: 'Email'.tr,
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
                                    child: Text('Change password'.tr,
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
                        title: 'Update'.tr,
                        buttonWidth: 1.0,
                        buttonHeight: 45.0,
                        color: litePurple,
                        fontSize: 14.0,
                        onPressed: () {
                          controller.updateUsername();
                        },
                      ),
                      Gap(15),
                      HumeButton(
                        title: 'Language'.tr,
                        buttonWidth: 1.0,
                        buttonHeight: 45.0,
                        color: litePurple,
                        fontSize: 14.0,
                        onPressed: () {
                          Get.to(() => TranslateScreen());
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
        ),
      ),
    );
  }
}

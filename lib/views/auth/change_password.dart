// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/guest_topbar.dart';
import 'package:hume/components/input_field_pass.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/ui_utils.dart';
import 'package:hume/views/auth/auth_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
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
                              'Change password'.tr,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: mainColor),
                            ) ,
                          ],
                        ),
                        Gap(59),
                        PasswordInputField(
                          hint: 'Old password'.tr,
                          obscure: controller.obscureOldPassword,
                          toggle: controller.toggleOldPassword,
                          controller: controller.oldPassword,
                          color: mainColor,
                        ),
                        Gap(20),
                        PasswordInputField(
                          hint: 'New password'.tr,
                          obscure: controller.obscureNewPassword,
                          toggle: controller.toggleNewPassword,
                          controller: controller.newPassword,
                          color: mainColor,
                        ),
                        Gap(20),
                        PasswordInputField(
                          obscure: controller.obscureConfirmPassword,
                          toggle: controller.toggleConfirmPassword,
                          hint: 'Confirm password'.tr,
                          controller: controller.confirmCPassword,
                          color: mainColor,
                        ),
                        Gap(145),
                        HumeButton(
                          title: 'Update'.tr,
                          onPressed: controller.changePasswordFields.value
                              ? () {
                                  controller.changePassword();
                                }
                              : () {
                                  UiUtilites.errorSnackbar(
                                      'Fill out all fields'.tr,
                                      'Please fill all above fields'.tr);
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

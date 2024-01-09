// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hume/components/button.dart';
import 'package:hume/components/guest_topbar.dart';
import 'package:hume/components/input_field.dart';
import 'package:hume/components/input_field_pass.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/colors.dart';
import 'package:hume/utils/controller_initlization.dart';
import 'package:hume/utils/ui_utils.dart';
import 'package:hume/views/auth/auth_controller.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
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
                    Gap(20),
                    ToggleSwitch(
                      initialLabelIndex: controller.tabIndex,
                      labels: [
                        'Sign up',
                        'Sign in',
                      ],
                      totalSwitches: 2,
                      onToggle: (index) {
                        controller.setIndex(index);
                      },
                      borderWidth: 3,
                      radiusStyle: true,
                      fontSize: 15,
                      minWidth: 110,
                      borderColor: [mainColor],
                      minHeight: 45,
                      cornerRadius: 40,
                      changeOnTap: true,
                      inactiveFgColor: Color.fromARGB(255, 9, 9, 9),
                      activeFgColor: Color.fromARGB(255, 255, 255, 255),
                      inactiveBgColor: Color.fromARGB(255, 255, 255, 255),
                      activeBgColor: [mainColor],
                      activeBorders: [
                        Border.all(
                          color: mainColor,
                          width: 3.0,
                        ),
                        Border.all(
                          color: mainColor,
                          width: 3.0,
                        ),
                      ],
                    ),
                    Gap(20),
                    controller.tabIndex == 0
                        ? Column(
                            children: [
                              InputField(
                                hint: 'Name',
                                controller: controller.name,
                                color: mainColor,
                              ),
                              Gap(15),
                              InputField(
                                hint: 'Phone number',
                                controller: controller.SignUpPhone,
                                color: mainColor,
                              ),
                              Gap(15),
                              InputField(
                                hint: 'Email',
                                controller: controller.email,
                                color: mainColor,
                              ),
                              Gap(15),
                              PasswordInputField(
                                hint: 'Password',
                                controller: controller.password,
                                color: mainColor,
                                obscure: controller.passObscure,
                                toggle: controller.passToggle,
                              ),
                              Gap(15),
                              PasswordInputField(
                                hint: 'Confirm password',
                                controller: controller.confirmPassword,
                                color: mainColor,
                                obscure: controller.confirmPassObscure,
                                toggle: controller.confirmPassToggle,
                              ),
                              Gap(20),
                              HumeButton(
                                title: 'Done',
                                onPressed: controller.areFieldsFilled.value
                                    ? () {
                                        controller.signUpUser();
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
                        : Column(
                            children: [
                              InputField(
                                hint: 'Email',
                                controller: controller.loginEmail,
                                color: mainColor,
                              ),
                              Gap(15),
                              PasswordInputField(
                                hint: 'Password',
                                controller: controller.loginPassword,
                                color: mainColor,
                                obscure: controller.passObscure,
                                toggle: controller.passToggle,
                              ),
                              Gap(15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.forget_password);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30.0, bottom: 20),
                                      child: Text('Forget password?',
                                          style: TextStyle(
                                              color: mainColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )
                                ],
                              ),
                              HumeButton(
                                title: 'Done',
                                onPressed: controller.areLoginFieldsFilled.value
                                    ? () {
                                        controller.signInUser();
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

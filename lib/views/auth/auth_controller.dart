import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/exceptions/auth_api_exception.dart';
import 'package:hume/models/app_user.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/services/user_service.dart';
import 'package:hume/utils/ui_utils.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  int tabIndex = 0;
  bool passObscure = true;
  bool confirmPassObscure = true;

  RxBool areFieldsFilled = false.obs;
  RxBool areLoginFieldsFilled = false.obs;
  RxBool areForgetFieldsFilled = false.obs;
  final _authApi = AuthApi();
  final _userService = UserService();

//----------------sign up credentials--------------
  String phone = '';
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

//-----------login credentials----------------
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

//----------forget password email------------
  TextEditingController forgetPasswordMail = TextEditingController();

  void setIndex(index) {
    tabIndex = index;
    update();
  }

  void passToggle() {
    passObscure = !passObscure;
    update();
  }

  void confirmPassToggle() {
    confirmPassObscure = !confirmPassObscure;
    update();
  }

  void checkFields() {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      areFieldsFilled.value = true;
      update();
    } else {
      areFieldsFilled.value = false;
      update();
    }
  }

  void checkLoginFields() {
    if (loginEmail.text.isNotEmpty && loginPassword.text.isNotEmpty) {
      areLoginFieldsFilled.value = true;
      update();
    } else {
      areLoginFieldsFilled.value = false;
      update();
    }
  }

  void checkForgetFields() {
    if (forgetPasswordMail.text.isNotEmpty) {
      areForgetFieldsFilled.value = true;
      update();
    } else {
      areForgetFieldsFilled.value = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    name.addListener(() {
      checkFields();
    });
    email.addListener(() {
      checkFields();
    });
    password.addListener(() {
      checkFields();
    });
    confirmPassword.addListener(() {
      checkFields();
    });
    loginEmail.addListener(() {
      checkLoginFields();
    });
    loginPassword.addListener(() {
      checkLoginFields();
    });
    forgetPasswordMail.addListener(() {
      checkForgetFields();
    });
  }

//--------------sign up with email and password
  Future signUpUser() async {
    try {
      final User user = await _authApi.signUpWithEmail(
        email: email.text,
        password: password.text,
      );

      if (user.uid.isNotEmpty) {
        await _userService.syncOrCreateUser(
          user: AppUser(
              id: user.uid, email: user.email, name: name.text, phone: phone),
        );
        UiUtilites.successSnackbar(
            'Register User', 'User registered successfully');
        Get.offNamed(AppRoutes.main);
      }
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Signup Failed', e.toString());
    }
  }

//---------Login with email and password---------------
  Future signInUser() async {
    try {
      final User user = await _authApi.loginWithEmail(
        email: loginEmail.text,
        password: loginPassword.text,
      );

      if (user.uid.isNotEmpty) {
        AppUser? appUser = await _userService.getAuthUser();

        if (appUser != null) {
          await _userService.syncOrCreateUser(
            user: AppUser(
                id: user.uid, email: user.email, name: user.displayName),
          );

          Get.offNamed(AppRoutes.main);
        } else {
          UiUtilites.errorSnackbar(
              'Invalid Credentials', 'Please Provide Correct Credentials');
        }
      }
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Signin Failed', e.toString());
    }
  }

//------------------sign in with google account----------
  Future signInGoogle() async {
    try {
      final User user = await _authApi.signInWithGoogle();

      if (user.uid.isNotEmpty) {
        await _userService.syncOrCreateUser(
          user:
              AppUser(id: user.uid, email: user.email, name: user.displayName),
        );

        Get.offNamed(AppRoutes.main);
      }
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Signin Failed', e.toString());
    }
  }

//---------------forget password-------------
  Future forgotPassword() async {
    try {
      final bool isSent = await _authApi.forgotPassword(
        email: forgetPasswordMail.text,
      );
      if (isSent) {
        await UiUtilites.successSnackbar(
            'Forget Password', 'Reset password link has been sent to email');
        Get.offNamed(AppRoutes.auth);
      }
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Forget password Failed', e.toString());
    }
  }
}

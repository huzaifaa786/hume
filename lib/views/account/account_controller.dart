import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/account_api.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/exceptions/auth_api_exception.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/app_user.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/ui_utils.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  final _accountApi = AccountApi();
  final Rx<AppUser?> user = Rx<AppUser?>(null);
  final _authApi = AuthApi();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  void onInit() {
    fetchUser(FirebaseAuth.instance.currentUser!.uid);
    super.onInit();
  }

  Future logout() async {
    try {
      await _authApi.logout();

      Get.offAllNamed(AppRoutes.auth_options);
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Logout Failed', e.toString());
    }
  }

  Future<void> fetchUser(String userId) async {
    LoadingHelper.show();
    final fetchedUser = await _accountApi.getUserById(userId);
    user.value = fetchedUser;
    name.text = user.value!.name.toString();
    email.text = user.value!.email.toString();
    phone.text = user.value!.phone.toString();
    update();
    LoadingHelper.dismiss();
  }
}

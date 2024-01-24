import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  List<String>? providerNames = [];
  @override
  void onInit() {
    providerNames =
        FirebaseAuth.instance.currentUser!.providerData.map((provider) {
      return provider.providerId;
    }).toList();
    update();
    fetchUser(FirebaseAuth.instance.currentUser!.uid);

    super.onInit();
  }

  Future logout() async {
    try {
      // GetStorage box = GetStorage();
      // await box.write('Locale', 'en');
      // GoogleTranslatorController.init(
      //     'AIzaSyBOr3bXgN2bj9eECzSudyj_rgIFjyXkdn8', Locale('ur'),
      //     cacheDuration: Duration(), translateTo: Locale('en'));
      Get.updateLocale(const Locale('en', 'US'));
      GetStorage box = GetStorage();
      await box.write('locale', 'en');
      box.read('locale');
      await _authApi.logout();

      Get.offAllNamed(AppRoutes.auth_options);
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Logout Failed'.tr, e.toString());
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

  Future<void> updateUsername() async {
    LoadingHelper.show();
    await _accountApi.updateUsername(name.text);
    LoadingHelper.dismiss();
    fetchUser(FirebaseAuth.instance.currentUser!.uid);
    UiUtilites.successSnackbar('', 'username updated successfully'.tr);
  }
}

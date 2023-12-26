import 'package:get/get.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/exceptions/auth_api_exception.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/utils/ui_utils.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();

 final _authApi = AuthApi();
 
  Future logout() async {
    try {
      await _authApi.logout();

      Get.offAllNamed(AppRoutes.auth_options);
    } on AuthApiException catch (e) {
      UiUtilites.errorSnackbar('Logout Failed', e.toString());
    }
  }
}

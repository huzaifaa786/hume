import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      checkFirstSeen();
      update();
    });
  }

  Future checkFirstSeen() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offNamed(AppRoutes.auth_options);
    } else {
      Get.offNamed(AppRoutes.auth_options);
    }
  }
}

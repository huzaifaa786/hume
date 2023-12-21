import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find();

  void initscreen() async {
    await Future.delayed(const Duration(seconds: 2), () {
      checkFirstSeen();
      update();
    });
  }

  Future checkFirstSeen() async {
      // final User? user = FirebaseAuth.instance.currentUser;

      // if (user != null) {
        Get.offNamed(AppRoutes.checkout);
      // } else {
        // Get.offNamed(AppRoutes.signin);
      // }
  }
}

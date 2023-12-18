import 'package:get/get.dart';
import 'package:hume/routes/app_routes.dart';
import 'package:hume/views/splash/splash_binding.dart';
import 'package:hume/views/splash/splash_view.dart';
import 'package:hume/views/welcome/welcome_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
       GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeView(),
    ),
  ];
}

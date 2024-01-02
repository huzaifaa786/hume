import 'package:hume/services/payment_service.dart';
import 'package:hume/views/auth/auth_controller.dart';
import 'package:hume/views/cart/cart_controller.dart';
import 'package:hume/views/home/home_controller.dart';
import 'package:hume/views/search_product.dart/search_product_controller.dart';
import 'package:hume/views/splash/splash_controller.dart';

SplashController splashController = SplashController.instance;
AuthController authController = AuthController.instance;
HomeController homeController = HomeController.instance;

SearchProductController searchProductController = SearchProductController.instance;
PaymentService paymentService = PaymentService.instance;

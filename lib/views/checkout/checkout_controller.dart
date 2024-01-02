import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController instance = Get.find();

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  void onInit() {

    super.onInit();
  }

 Future  confirmPayment ()async{

 }
}

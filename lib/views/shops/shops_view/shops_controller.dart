import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsController extends GetxController {
  static ShopsController instance = Get.find();
  final scrollController = ScrollController();
  @override
  void onInit() {
    scrollController.addListener(scrollListener);

    super.onInit();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollThreshold = maxScroll * 0.8;
    print('VERTICAL');
    if (currentScroll >= scrollThreshold) {
   
    }
  }
}

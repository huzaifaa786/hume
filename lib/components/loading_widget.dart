import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(child: Padding(
        padding: const EdgeInsets.only(top:38.0),
        child: Text(text),
      )),
    )));
  }
}

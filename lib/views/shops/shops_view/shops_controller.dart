// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hume/api/shop_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/shop.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopsController extends GetxController {
  static ShopsController instance = Get.find();
  final scrollController = ScrollController();
  final ShopApi shopApi = ShopApi();
  DocumentSnapshot? lastDocument;
  RxList<Shop> shops = <Shop>[].obs;

  @override
  void onInit() {
    fetchShops();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollThreshold = maxScroll * 0.8;

    if (currentScroll >= scrollThreshold) {
      if (lastDocument != null) {
        fetchShops();
        lastDocument = null;
      }
    }
  }

  Future<void> fetchShops() async {
    LoadingHelper.show();
    List<Map<String, dynamic>> newItems =
        await shopApi.fetchShops(lastDocument);

    if (newItems.isNotEmpty) {
      lastDocument = newItems.last['doc'] as DocumentSnapshot?;
    }

    shops.addAll(newItems.map((e) => Shop.fromMap(e)).toList().obs);

    update();
    LoadingHelper.dismiss();
  }

  Future<void> whatsapp(String contact, String message) async {
    Uri url = Uri.parse('whatsapp://send?phone=$contact&text=$message');

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        url = Uri.parse('https://wa.me/$contact?text=$message');
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          EasyLoading.showError(
              'WhatsApp is not installed or cannot be launched.');
        }
      }
    } catch (e) {
      EasyLoading.showError('Failed to launch WhatsApp: $e');
    }
  }

  callNumber() async {
    Uri phoneno = Uri.parse('tel:+97798345348734');
    if (await launchUrl(phoneno)) {
      //dialer opened
    } else {
      EasyLoading.showError('Unable to launch dialer pad');
    }
  }

  sendMail() async {
    String email = Uri.encodeComponent("Admin@gmail.com.com");
    String subject = Uri.encodeComponent("Hello");
    print(subject); //output: Hello%20Flutter
    Uri mail = Uri.parse("mailto:$email?subject=$subject");
    if (await launchUrl(mail)) {
      //email app opened
    } else {
      EasyLoading.showError('Unable to launch dialer pad');
    }
  }
}

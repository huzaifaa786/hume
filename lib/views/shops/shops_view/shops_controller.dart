import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/shop_api.dart';
import 'package:hume/models/shop.dart';

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
      fetchShops();
    }
  }

  Future<void> fetchShops() async {
    List<Map<String, dynamic>> newItems =
        await shopApi.fetchShops(lastDocument);

    if (newItems.isNotEmpty) {
      lastDocument = newItems.last['doc'] as DocumentSnapshot?;
    }


    shops.addAll(newItems.map((e) => Shop.fromMap(e)).toList().obs);

    update();
  }
}

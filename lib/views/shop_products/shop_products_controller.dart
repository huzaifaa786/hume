import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/api/shop_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';

class ShopProductsController extends GetxController {
  static ShopProductsController instance = Get.find();
  final scrollController = ScrollController();
  final ShopApi shopApi = ShopApi();
  DocumentSnapshot? lastDocument;
  List<Product> products = [];
  String shopName = '';

  @override
  void onInit() {
    fetchProducts();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollThreshold = maxScroll * 0.9;

    if (currentScroll >= scrollThreshold) {
      if (lastDocument != null) {
        print('object');
        fetchProducts();
        lastDocument = null;
      }
    }
  }

  Future<void> fetchProducts() async {
    LoadingHelper.show();
    List<Map<String, dynamic>> newItems = await shopApi.fetchproductsByShopId(
        lastDocument, Get.parameters['shop_id'] ?? '');

    if (newItems.isNotEmpty) {
      lastDocument = newItems.last['doc'] as DocumentSnapshot?;
    }

    products.addAll(newItems.map((e) => Product.fromMap(e)).toList().obs);
    LoadingHelper.dismiss();
    update();
  }
}

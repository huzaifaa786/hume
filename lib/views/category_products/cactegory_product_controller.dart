import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';

class CategoryProductController extends GetxController {
  static CategoryProductController instance = Get.find();
  final scrollController = ScrollController();
  final ProductApi productApi = ProductApi();
  DocumentSnapshot? lastDocument;
  List<Product> products = [];
  String category = 'New arrivals';

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
    List<Map<String, dynamic>> newItems = await productApi.fetchproducts(
        lastDocument, Get.parameters['category'] ?? '');

    if (newItems.isNotEmpty) {
      lastDocument = newItems.last['doc'] as DocumentSnapshot?;
    }

    products.addAll(newItems.map((e) => Product.fromMap(e)).toList().obs);
    LoadingHelper.dismiss();
    update();
  }
}

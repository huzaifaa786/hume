// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';
import 'package:hume/utils/translation.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  final ProductApi _productApi = ProductApi();
  int currentIndex = 0;
  final clotheproducts = <Product>[].obs;
  final furnitureproducts = <Product>[].obs;
  final bagsandshoesproducts = <Product>[].obs;
  final makeupproducts = <Product>[].obs;
  final homeandkitchenproducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    update();
  }

  List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  void setCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  void fetchBannerImages() {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('banners');
      collectionRef.limit(1).get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final document = snapshot.docs.first;
          final data = document.data();
          final imageUrl1 = data['imageUrl1'];
          final imageUrl2 = data['imageUrl2'];
          final imageUrl3 = data['imageUrl3'];

          // Update the RxList with the fetched image URLs
          imgList = [
            imageUrl1,
            imageUrl2,
            imageUrl3,
          ];
          currentIndex = 0;
          update();
        } else {
          print('No documents found in the collection');
        }
      });
    } catch (e) {
      print('Error fetching banner images: $e');
    }
  }

  void fetchClothesProducts(String categoryName) {
    LoadingHelper.show();
    _productApi
        .fetchProductsByCategorywithLimit6(categoryName)
        .then((fetchedProducts) {
      clotheproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchFurnitureProducts(String categoryName) {
    LoadingHelper.show();
    _productApi
        .fetchProductsByCategorywithLimit6(categoryName)
        .then((fetchedProducts) {
      furnitureproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchBagsandshoesProducts(String categoryName) {
    LoadingHelper.show();
    _productApi
        .fetchProductsByCategorywithLimit6(categoryName)
        .then((fetchedProducts) {
      bagsandshoesproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchMakeupProducts(String categoryName) {
    LoadingHelper.show();
    _productApi
        .fetchProductsByCategorywithLimit6(categoryName)
        .then((fetchedProducts) {
      makeupproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchHomeandkitchenProducts(String categoryName) {
    LoadingHelper.show();
    _productApi
        .fetchProductsByCategorywithLimit6(categoryName)
        .then((fetchedProducts) {
      homeandkitchenproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }
}

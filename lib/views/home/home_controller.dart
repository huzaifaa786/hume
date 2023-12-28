import 'package:get/get.dart';
import 'package:hume/api/product_api.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  final ProductApi _productApi = ProductApi();
  int currentIndex = 0;
  final clotheproducts = <Product>[].obs;
  final furnitureproducts = <Product>[].obs;
  final bagsandshoesproducts = <Product>[].obs;
  final makeupproducts = <Product>[].obs;
  final homeandkitchenproducts = <Product>[].obs;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'
  ];

  void setCurrentIndex(index) {
    currentIndex = index;
    update();
  }

  void fetchClothesProducts(String categoryName) {
    LoadingHelper.show();
    _productApi.fetchProductsByCategorywithLimit6(categoryName).then((fetchedProducts) {
      clotheproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchFurnitureProducts(String categoryName) {
    LoadingHelper.show();
    _productApi.fetchProductsByCategorywithLimit6(categoryName).then((fetchedProducts) {
      furnitureproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchBagsandshoesProducts(String categoryName) {
    LoadingHelper.show();
    _productApi.fetchProductsByCategorywithLimit6(categoryName).then((fetchedProducts) {
      bagsandshoesproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchMakeupProducts(String categoryName) {
    LoadingHelper.show();
    _productApi.fetchProductsByCategorywithLimit6(categoryName).then((fetchedProducts) {
      makeupproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }

  void fetchHomeandkitchenProducts(String categoryName) {
    LoadingHelper.show();
    _productApi.fetchProductsByCategorywithLimit6(categoryName).then((fetchedProducts) {
      homeandkitchenproducts.value = fetchedProducts;
      LoadingHelper.dismiss();
    });
  }
}

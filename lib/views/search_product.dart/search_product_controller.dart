import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume/helper/loading.dart';
import 'package:hume/models/product.dart';
import 'package:hume/utils/translation.dart';

class SearchProductController extends GetxController {
  static SearchProductController instance = Get.find();
  List<Product>? products = [];
  final searchQuery = ''.obs;
  List<Product>? filteredProducts = [];

  String? hintstring;
  hintTranslate() async {
    hintstring = await translateText('search');
    update();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   hintTranslate();
  //   update();
  // }

  void fetchProducts() async {
    LoadingHelper.show();
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    products =
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
    LoadingHelper.dismiss();
    filterProducts();
    update();
  }

  void search(String query) {
    searchQuery.value = query;
    filterProducts();
  }

  void filterProducts() {
    if (searchQuery.isEmpty) {
      filteredProducts = products;
      update();
    } else {
      filteredProducts = products!
          .where((product) =>
              product.name!.contains(searchQuery.value.toLowerCase()) ||
              product.category!
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
      update();
    }
  }
}

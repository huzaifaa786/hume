import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume/models/product.dart';

class SearchProductController extends GetxController {
  List<Product>? products = [];
  final searchQuery = ''.obs;
  List<Product>? filteredProducts = [];

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    products =
        snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList();
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
    } else {
      filteredProducts = products!
          .where((product) =>
              product.name!.contains(searchQuery.value.toLowerCase()) ||
              product.category!
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }
}

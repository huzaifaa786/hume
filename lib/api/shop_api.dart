import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume/models/product.dart';
import 'package:hume/models/shop.dart';

class ShopApi {
  static const int chunkSize = 10;
  static const String shopCollection = 'shops';
  static const String productCollection = 'products';

  Future<List<Map<String, dynamic>>> fetchShops(
      DocumentSnapshot? lastDocument) async {
    Query query = FirebaseFirestore.instance
        .collection(shopCollection)
        .orderBy(FieldPath.documentId)
        .limit(chunkSize);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();

    List<Map<String, dynamic>> items = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> itemData = doc.data() as Map<String, dynamic>;
      itemData['doc'] = doc;
      items.add(itemData);
    }

    return items;
  }

  Future<Shop?> getShopData(shopId) async {
    print(shopId);

    final shopSnapshot = await FirebaseFirestore.instance
        .collection(shopCollection)
        .doc(shopId)
        .get();

    return Shop.fromMap(shopSnapshot.data() as Map<String, dynamic>);
  }

  Future<List<Product>> fetchProductsByShopwithLimit6(String shopId) async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('shopId', isEqualTo: shopId)
        .limit(6)
        .get();

    final List<Product> fetchedProducts = [];
    for (final doc in snapshot.docs) {
      final product = Product.fromJson(doc.data() as Map<String, dynamic>);
      fetchedProducts.add(product);
    }
    return fetchedProducts;
  }

  Future<List<Map<String, dynamic>>> fetchproductsByShopId(
      DocumentSnapshot? lastDocument, String shopId) async {
    Query query = FirebaseFirestore.instance
        .collection(productCollection)
        .where('shopId', isEqualTo: shopId)
        .orderBy(FieldPath.documentId, descending: true)
        .limit(chunkSize);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();

    List<Map<String, dynamic>> items = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> itemData = doc.data() as Map<String, dynamic>;
      itemData['doc'] = doc;
      items.add(itemData);
    }

    return items;
  }
}

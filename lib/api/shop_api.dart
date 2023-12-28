import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hume/models/product.dart';
import 'package:hume/models/shop.dart';

class ShopApi {
  static const int chunkSize = 10;
  static const String shopCollection = 'shops';

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

  // Future<List<Product>> fetchProducts(shopId) async {}
}

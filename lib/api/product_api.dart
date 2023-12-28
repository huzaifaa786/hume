import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hume/models/product.dart';

class ProductApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const int chunkSize = 10;
  static const String productCollection = 'products';

  ///Fetch full product items from collection on scroll controller position load 10 Item at a time
  ///
  Future<List<Map<String, dynamic>>> fetchproducts(
      DocumentSnapshot? lastDocument, String categoryName) async {
    Query query = FirebaseFirestore.instance
        .collection(productCollection)
        .where('category', isEqualTo: categoryName)
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

  ///Fetch Only 6 product For Home View
  ///
  Future<List<Product>> fetchProductsByCategorywithLimit6(
      String categoryName) async {
    final QuerySnapshot snapshot = await _firestore
        .collection('products')
        .where('category', isEqualTo: categoryName)
        .limit(6)
        .get();

    final List<Product> fetchedProducts = [];
    for (final doc in snapshot.docs) {
      final product = Product.fromJson(doc.data() as Map<String, dynamic>);
      fetchedProducts.add(product);
    }
    return fetchedProducts;
  }
}

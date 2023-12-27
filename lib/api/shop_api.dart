import 'package:cloud_firestore/cloud_firestore.dart';

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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsController extends GetxController {
  static ShopsController instance = Get.find();
  final scrollController = ScrollController();
  final chunkSize = 10;
  final collectionPath = 'your_collection';
  DocumentSnapshot? lastDocument;

  @override
  void onInit() {
    scrollController.addListener(scrollListener);

    super.onInit();
  }

  void scrollListener() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double scrollThreshold = maxScroll * 0.8;
    print('VERTICAL');
    if (currentScroll >= scrollThreshold) {
      fetchItems();
    }
  }

  Future<void> fetchItems() async {
    // Construct the Firestore query
    Query query = FirebaseFirestore.instance
        .collection(collectionPath)
        .orderBy(FieldPath.documentId)
        .limit(chunkSize);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }

    // Fetch the items
    QuerySnapshot querySnapshot = await query.get();

    // Process the fetched data
    List<ListItem> newItems = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      String id = doc.id;
      String name = doc.data()['name'];
      String userId = doc.data()['userId'];
      String adminId = doc.data()['adminId'];

      // Fetch user data
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      UserData userData = UserData.fromJson(userSnapshot.data()!);

      // Fetch admin data
      DocumentSnapshot adminSnapshot = await FirebaseFirestore.instance
          .collection('admins')
          .doc(adminId)
          .get();
      AdminData adminData = AdminData.fromJson(adminSnapshot.data()!);

      newItems.add(
        ListItem(
          id: id,
          name: name,
          userData: userData,
          adminData: adminData,
        ),
      );
    }

    // Update the last fetched document
    if (querySnapshot.docs.isNotEmpty) {
      lastDocument = querySnapshot.docs.last;
    }

    // Add the new items to the existing list
    items.addAll(newItems);

    // Update the UI
    update();
  }
}

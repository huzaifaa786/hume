import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hume/models/app_user.dart';

class AccountApi {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<AppUser?> getUserById(String userId) async {
    final DocumentSnapshot snapshot = await userCollection.doc(userId).get();
    if (snapshot.exists) {
      final userData = snapshot.data() as Map<String, dynamic>;
      return AppUser.fromJson(userData);
    }
    return null;
  }

  Future<void> updateUsername(String username) async {
    await userCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'name': username});
  }
}

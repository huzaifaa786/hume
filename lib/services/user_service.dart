// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hume/api/auth_api.dart';
import 'package:hume/api/database_api.dart';
import 'package:hume/models/app_user.dart';

class UserService {
  final _authApi = AuthApi();
  final _databaseApi = DatabaseApi();

  AppUser? _currentUser;

  AppUser get currentUser => _currentUser!;

  Future<bool> syncUser() async {
    final userId = _authApi.currentUser!.uid;
    print('AAAAAAAAAAA');
    print(userId);
    final userAccount = await _databaseApi.getUserLogin(userId);

    if (userAccount.id != '123') {
      _currentUser = userAccount;
      return true;
    }
    return false;
  }

  Future<void> syncOrCreateUser({
    required AppUser user,
  }) async {
    await syncUser().then((value) async {
      if (/*_currentUser == null*/ value == false) {
        await _databaseApi.createUser(user);
      } else {
        String? token = await FirebaseMessaging.instance.getToken();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .update({'token': token});
      }
    });
  }

  Future getAuthUser() async {
    final userId = _authApi.currentUser!.uid;

    final userAccount = await _databaseApi.getUserLogin(userId);

    if (userAccount.id != '123') {
      _currentUser = userAccount;
      return _currentUser;
    }
    return null;
  }

  Future<void> updateUser({
    required id,
    required user,
  }) async {
    await _databaseApi.updateUser(id, user);
  }
}

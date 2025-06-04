import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapidaidv2/models/user_model.dart';

class UserProvider with ChangeNotifier {
  String? _username;
  String? _email;
  String? _phone;
  String? _location;
  String? _profilePhotoUrl;
  UserModel? _user;

  String? get username => _username;
  String? get email => _email;
  String? get phone => _phone;
  String? get location => _location;
  String? get profilePhotoUrl => _profilePhotoUrl;
  UserModel? get user => _user;

  Future<void> loadUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

        final data = snapshot.data();
        if (data != null) {
          _username = data['username'];
          _email = data['email'];
          _phone = data['phone'];
          _location = data['location'];
          _profilePhotoUrl = data['profilePhotoUrl'];
          notifyListeners();
        }
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  void clearUser() {
    _username = null;
    _email = null;
    _phone = null;
    _location = null;
    _profilePhotoUrl = null;
    notifyListeners();
  }
}

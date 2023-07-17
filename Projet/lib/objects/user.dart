import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TheUser {
  String? email;
  String? uid;
  String? username;

  TheUser({required this.email, required this.uid});

  factory TheUser.fromFirebaseUser(User user) {
    return TheUser(email: user.email, uid: user.uid);
  }
}




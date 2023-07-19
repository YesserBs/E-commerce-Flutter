import 'package:firebase_auth/firebase_auth.dart';

class TheUser {
  String? email;
  String? uid;
  String? username;

  TheUser({required this.email, required this.uid, this.username});

  factory TheUser.fromFirebaseUser(User user) {
    return TheUser(email: user.email, uid: user.uid);
  }
}

class UserController {
  static TheUser? currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> retrieveUserInfos(String username) async {
    User? user = _auth.currentUser;

    if (user != null) {
      // Gets email and uid from the user instance
      currentUser = TheUser.fromFirebaseUser(user);

      if (username.isEmpty) {
        print("Username will be retrived from database");
      } else {
        currentUser!.username = username;
        print("Username will be stored in database");
      }
    }
  }
}

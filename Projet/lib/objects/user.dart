import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/view/auth/signup/signup_controller.dart';

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
  String? uid = '';
  static TheUser? currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> retrieveUserInfos(String username) async {
    User? user = _auth.currentUser;

    if (user != null) {
      // Gets email and uid from the user instance
      currentUser = TheUser.fromFirebaseUser(user);

      if (username.isEmpty) {
        // Username is empty so we will bring it from Firestore
        currentUser!.username = await getUsernameByUid(currentUser!.uid!);
        print("Username fetched from the database: ${currentUser!.username}");
        String? ok = currentUser!.username;
        Get.find<SignupController>().GetUsername(ok!);


      } else {
        print("Username is not empty. Storing in Firestore...");
        currentUser!.username = username;
        uid = currentUser!.uid;
        addUserToFirestore(username, uid!);
        print("Username stored in the database: ${currentUser!.username}");
      }
    }
  }

  Future<String> getUsernameByUid(String uid) async {
    try {
      DocumentSnapshot snapshot =
      await firestore.collection('users').doc(uid).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['username'];
      } else {
        // Document with the given UID does not exist
        return '';
      }
    } catch (e) {
      print('Error fetching username: $e');
      return '';
    }
  }
}

void addUserToFirestore(String username, String uid) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a new document with the UID as the document ID
  DocumentReference userRef = firestore.collection('users').doc(uid);

  // Set the username field in the document
  userRef.set({'username': username}).then((_) {
    print('User added to Firestore with UID: $uid');
  }).catchError((error) {
    print('Failed to add user: $error');
  });
}

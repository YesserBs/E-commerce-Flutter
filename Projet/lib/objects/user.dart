import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> retrieveUserInfos(String username) async {
    User? user = _auth.currentUser;

    if (user != null) {
      // Gets email and uid from the user instance
      currentUser = TheUser.fromFirebaseUser(user);

      if (username.isEmpty) {
        // Retrieve username from Firestore
        DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
            .collection('users')
            .doc(currentUser!.uid)
            .get();

        if (snapshot.exists) {
          // Username exists in Firestore, retrieve it
          currentUser!.username = snapshot.get('username');
          print("Username retrieved from the database: ${currentUser!.username}");
        } else {
          print("Username does not exist in the database");
        }
      } else {
        // Store username in Firestore
        currentUser!.username = username;
        var uid = currentUser!.uid;
        addUserToFirestore(username, uid!);
        print("Username stored in the database: ${currentUser!.username}");
      }
    }
  }
}

void addUserToFirestore(String username, String uid) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Create a new document with the UID as the document ID
  DocumentReference userRef = firestore.collection('users').doc(uid);

  // Set the username field in the document
  userRef.set({'username': username, 'uid': uid,}).then((_) {
    print('User added to Firestore!');
  }).catchError((error) {
    print('Failed to add user: $error');
  });
}


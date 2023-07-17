import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/main_settings/appPages.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../objects/user.dart';

// Here will be set the first screen when we open the app
// depending on isAuthenticated
String auth() {
  retriveUserInfos();
  final box = GetStorage();
  final isAuthenticated = box.read('isAuthenticated') ?? false;
  print("$isAuthenticated");
  deleteVariable();
  if (isAuthenticated) {
    return AppPages.DASHBOARD;
  } else{
    return AppPages.LOGIN;
  }
}

void logOut() {
  final box = GetStorage();
  box.write('isAuthenticated', false);
  Get.offAllNamed(AppPages.LOGIN);
}


// In case we need to delete a getStorage variable
void deleteVariable() {
  final box = GetStorage();
  box.remove('isConnected');
}


void printUser(){
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  if (user != null) {
    String? email = user.email;
    String uid = user.uid;
    // There are many other user properties
    print("email: $email | uid: $uid");
  }
  else{
    print("No user check printUser");
  }
}

void retriveUserInfos(){
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;
  TheUser? currentUser;

  if (user != null) {
    currentUser = TheUser.fromFirebaseUser(user);
    print("email: ${currentUser.email} | uid: ${currentUser.uid}");
  }
}


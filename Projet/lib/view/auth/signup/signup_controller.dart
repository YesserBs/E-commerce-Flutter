import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/main_settings/appPages.dart';

import '../../../objects/user.dart';

class SignupController extends GetxController {
  UserController userController = UserController();
  final SignupformKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var errorMessage = ''.obs;
  var username = '_'.obs;
  final box = GetStorage();

  void Signup() async {
    try {
      if (SignupformKey.currentState?.validate() ?? false) {
        final String usrname = usernameController.text.trim();
        final String email = emailController.text.trim();
        final String password = passwordController.text.trim();
        GetUsername(usrname); // will be removed as we will make a user class
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          // Pass username as a parameter to the user profile class
          userController.retrieveUserInfos(username.value);
          box.write('isAuthenticated', true);
          Get.offAndToNamed(AppPages.DASHBOARD);// Navigate to HomeScreen
        }
      }
    } on FirebaseAuthException catch (e) {
      errorMessage.value = e.message!;
    }
  }

  void GetUsername(String usrname){
    username.value = usrname;
    update();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

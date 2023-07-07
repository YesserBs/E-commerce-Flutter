import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproj/pages/dashboard/dashboard_page.dart';
import 'package:myproj/pages/logging/log_in/login_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator if the authentication state is still loading
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              print(snapshot.data);
              // User is logged in, show the DashboardPage
              return DashboardPage();
            } else {
              // User is not logged in, show the LoginPage
              return LoginPage();
            }
          }
        },
      ),
    );
  }
}

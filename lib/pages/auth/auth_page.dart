import 'package:dawwen02/pages/auth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';
import '../NavPage.dart';
import 'login_or_regester.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is loged in
          if (snapshot.hasData) {
            return HomePage();
          }

          //is the user NOT logged in
          else {
            return LoginOrRegester();
          }
        },
      ),
    );
  }
}

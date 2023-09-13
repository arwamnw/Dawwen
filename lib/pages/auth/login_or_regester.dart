import 'package:dawwen02/pages/auth/Login.dart';
import 'package:flutter/material.dart';
import 'RegPage.dart';

class LoginOrRegester extends StatefulWidget {
  const LoginOrRegester({super.key});

  @override
  State<LoginOrRegester> createState() => _LoginOrRegesterState();
}

class _LoginOrRegesterState extends State<LoginOrRegester> {
  //show login page initially
  bool showloginpage = true;
  //toggel between login and reg
  void togglepages() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return LoginPage(onTap: togglepages);
    } else {
      return RegPage(onTap: togglepages);
    }
  }
}

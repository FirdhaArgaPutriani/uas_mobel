import 'package:flutter/material.dart';
import 'package:uas_mobel/pages/signin_page.dart';

import '../pages/signup_page.dart';
import '../pages/signin_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially, show the login page
  bool showSigninPage = true;

  void toggleScreens() {
    setState(() {
      showSigninPage = !showSigninPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSigninPage) {
      return SignInPage(showSignupPage: toggleScreens);
    } else {
      return SignUpPage(showSigninPage: toggleScreens);
    }
  }
}

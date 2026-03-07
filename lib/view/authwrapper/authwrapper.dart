import 'package:axiom_admin/view/dashboard/category_selection_screen.dart';
import 'package:axiom_admin/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLogin(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data == true) {
          return AdminDashboard();
        } else {
          return  SignInScreen();
        }
      },
    );
  }
}
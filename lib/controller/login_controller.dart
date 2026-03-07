
import 'package:axiom_admin/view/dashboard/category_selection_screen.dart';
import 'package:axiom_admin/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

Future<void> login(BuildContext context) async {
  const String hardcodedEmail = 'admin@axiom.com';
  const String hardcodedPassword = '123456';

  String enteredEmail = emailController.text.trim();
  String enteredPassword = passwordController.text;

  if (enteredEmail == hardcodedEmail &&
      enteredPassword == hardcodedPassword) {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => AdminDashboard()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid email or password')),
    );
  }
}
Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('isLoggedIn');

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) =>  SignInScreen()),
  );
}

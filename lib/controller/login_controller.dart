
import 'package:axiom_admin/view/dashboard/category_selection_screen.dart';
import 'package:flutter/material.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

void login(BuildContext context) {
  const String hardcodedEmail = 'admin@axiom.com';
  const String hardcodedPassword = '123456';

  String enteredEmail = emailController.text.trim();
  String enteredPassword = passwordController.text;

  if (enteredEmail == hardcodedEmail && enteredPassword == hardcodedPassword) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login successful!')),
    );

 
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AdminDashboard()));
  } else {
    // Login failed
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid email or password')),
    );
  }
}

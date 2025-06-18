import 'package:axiom_admin/view/login/widgets/loginfeilds.dart';
import 'package:axiom_admin/view/login/widgets/loginimage.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFF5F5F5)],
          ),
        ),
        child: Row(
          children: [
          Loginimge(),
            Expanded(
              child: Loginfields(),
            ),
          ],
        ),
      ),
    );
  }

 

  
}

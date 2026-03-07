import 'package:axiom_admin/view/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginfields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const Loginfields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<Loginfields> createState() => _LoginfieldsState();
}

class _LoginfieldsState extends State<Loginfields> {

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "Admin Login",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            /// EMAIL FIELD
            TextField(
              controller: widget.emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: "Email",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// PASSWORD FIELD WITH VISIBILITY TOGGLE
            TextField(
              controller: widget.passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                labelText: "Password",
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// LOGIN BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.read<LoginBloc>().add(
                        LoginBtn(
                          email: widget.emailController.text.trim(),
                          password: widget.passwordController.text.trim(),
                        ),
                      );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
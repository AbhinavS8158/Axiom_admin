
import 'package:axiom_admin/controller/login_controller.dart';
import 'package:axiom_admin/view/login/bloc/login_bloc.dart';
import 'package:axiom_admin/view/widget/primary_btn.dart';
import 'package:axiom_admin/view/widget/primay_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Loginfields extends StatelessWidget {
  const Loginfields({super.key});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.hexagon_outlined,
                    color: Colors.green,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "AXIOM",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              "Log in",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Log in your AXIOM account to Manage",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            PrimaryTextfield(
             controller: emailController,
              icon: Icons.email_outlined,
              label: 'Email',
              hint: 'Enter your email address',
              validator:  (value) {
                if(value == null||value .isEmpty){
                  return "Please enter the name";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: '********',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            PrimaryBtn( "Login",()=>context.read<LoginBloc>().add(LoginBtn(email: emailController.text, password: passwordController.text))),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

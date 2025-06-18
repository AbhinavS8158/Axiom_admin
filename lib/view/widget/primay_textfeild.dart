import 'package:axiom_admin/controller/login_controller.dart';
import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String label;
  final String hint;
  final  IconData? icon;
  final TextEditingController ?controller;
  
  const PrimaryTextfield({super.key, required this.label, required this.hint, this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
   
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
      ),
    );
  }
}
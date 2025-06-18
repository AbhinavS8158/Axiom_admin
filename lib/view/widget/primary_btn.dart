import 'package:axiom_admin/controller/login_controller.dart';
import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final String label;
  
  const PrimaryBtn({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          login(context);
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
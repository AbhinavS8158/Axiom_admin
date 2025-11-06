import 'package:flutter/material.dart';
class PrimaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PrimaryBtn(this.label, [this.onPressed, Key? key]) : super(key: key);

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
        onPressed:onPressed ?? () {
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
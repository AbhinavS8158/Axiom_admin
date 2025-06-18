// models/category_button_model.dart

import 'package:flutter/material.dart';

class CategoryButtonModel {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;


  CategoryButtonModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  
  });
}

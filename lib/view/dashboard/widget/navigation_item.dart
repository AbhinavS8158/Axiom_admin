
import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
 final VoidCallback onPressed;

  const NavigationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,

    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        color: Colors.blueGrey,
        child: ListTile(
          leading: Icon(
            icon,
            color: isActive ? Colors.blue : Colors.white70,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.white70,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
         onTap: onPressed,
        ),
      ),
    );
  }
}
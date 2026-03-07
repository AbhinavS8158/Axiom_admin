import 'package:axiom_admin/controller/login_controller.dart';
import 'package:axiom_admin/view/dashboard/widget/user_profile.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Dashboard Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:
                        (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const Text("Confirm Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); 
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context); 
                                logout(context); 
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                  );
                },
              ),
              const SizedBox(width: 10),
              const UserProfile(),
            ],
          ),
        ],
      ),
    );
  }
}

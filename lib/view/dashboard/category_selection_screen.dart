
import 'package:axiom_admin/view/dashboard/widget/dashboard_content.dart';
import 'package:axiom_admin/view/dashboard/widget/side_navigation.dart';
import 'package:axiom_admin/view/dashboard/widget/topbar.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideNavigation(),
          Expanded(
            child: Column(
              children: [
                const TopAppBar(),
                const Expanded(child: DashboardContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




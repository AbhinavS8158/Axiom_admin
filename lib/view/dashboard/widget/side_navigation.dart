import 'package:axiom_admin/view/dashboard/category_selection_screen.dart';
import 'package:axiom_admin/view/dashboard/widget/admin_header.dart';
import 'package:axiom_admin/view/dashboard/widget/navigation_item.dart';
import 'package:axiom_admin/view/pg/pg_list_screen.dart';
import 'package:axiom_admin/view/rental_list/rental_list_screen.dart';
import 'package:axiom_admin/view/seller_list/sell_list_screen.dart';
import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF1E293B),
      child: Column(
        children: [
          AdminHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                NavigationItem(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  isActive: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminDashboard(),
                      ),
                    );
                  },
                ),
                NavigationItem(
                  icon: Icons.people,
                  title: 'Rental',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RentalListScreen(),
                      ),
                    );
                  },
                ),
                NavigationItem(
                  icon: Icons.shopping_cart,
                  title: 'Seller',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellListScreen(),
                      ),
                    );
                  },
                ),
                NavigationItem(
                  icon: Icons.inventory,
                  title: 'PG',
                  onPressed: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => PgListScreen()),
                    );
                  },
                ),

                NavigationItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminDashboard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
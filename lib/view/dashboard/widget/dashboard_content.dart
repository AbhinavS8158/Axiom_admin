import 'package:axiom_admin/controller/services/firestore_services.dart';
import 'package:axiom_admin/view/dashboard/widget/quick_action_card.dart';
import 'package:axiom_admin/view/dashboard/widget/seat_cards.dart';
import 'package:flutter/material.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final statsService = FirestoreServices();

    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFF8FAFC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreetingSection(),
          const SizedBox(height: 20),

          /// 🔽 StreamBuilder replaces the old `StatsCardsRow`
          StreamBuilder<Map<String, int>>(
            stream: statsService.getStatsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return const Center(child: Text('Failed to load stats'));
              }

              final stats = snapshot.data!;
              return StatsCardsRow(
                totalRentals: stats['rentals'] ?? 0,
                totalSellers: stats['sellers'] ?? 0,
                totalPGs: stats['pgs'] ?? 0,
              );
            },
          ),

          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(child: QuickActionsCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 251, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            _getGreetingIcon(),
            color: Colors.blueGrey,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            _getGreeting(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning, Admin';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon, Admin';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening, Admin';
    } else {
      return 'Good Night, Admin';
    }
  }

  IconData _getGreetingIcon() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return Icons.wb_sunny_outlined ;
    } else if (hour >= 12 && hour < 17) {
      return Icons.wb_cloudy_outlined;
    } else if (hour >= 17 && hour < 21) {
      return Icons.nightlight_outlined;
    } else {
      return Icons.bedtime_outlined;
    }
  }
}

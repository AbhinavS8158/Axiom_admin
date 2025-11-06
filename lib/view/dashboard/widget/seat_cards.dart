
import 'package:flutter/material.dart';
class StatsCardsRow extends StatelessWidget {
  final int totalRentals;
  final int totalSellers;
  final int totalPGs;

  const StatsCardsRow({
    super.key,
    required this.totalRentals,
    required this.totalSellers,
    required this.totalPGs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatsCard(
            title: 'Total Rentals',
            value: totalRentals.toString(),
            icon: Icons.apartment,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: StatsCard(
            title: 'Total Sellers',
            value: totalSellers.toString(),
            icon: Icons.home,
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: StatsCard(
            title: 'Total PGs',
            value: totalPGs.toString(),
            icon: Icons.living,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
 

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(1000),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withAlpha(300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
          
            ],
          ),
          const SizedBox(height: 15),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

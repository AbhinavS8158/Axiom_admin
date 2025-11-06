import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String status;
  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color text;
    IconData icon;
    String displayStatus;

    switch (status) {
      case '1': // Accepted
        bg = const Color(0xFFD1FAE5);
        text = const Color(0xFF065F46);
        icon = Icons.check_circle;
        displayStatus = 'Accepted';
        break;
      case '2': // Rejected
        bg = const Color(0xFFFEE2E2);
        text = const Color(0xFF991B1B);
        icon = Icons.cancel;
        displayStatus = 'Rejected';
        break;
      default: // Pending
        bg = const Color(0xFFFEF3C7);
        text = const Color(0xFF92400E);
        icon = Icons.schedule;
        displayStatus = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: text),
          const SizedBox(width: 4),
          Text(
            displayStatus,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: text,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

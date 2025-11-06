
// import 'package:axiom_admin/view/category_selection/widget/activity_item.dart';
// import 'package:flutter/material.dart';

// class RecentActivityCard extends StatelessWidget {
//   const RecentActivityCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Recent Activity',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF1E293B),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: ListView(
//               children: const [
//                 ActivityItem(
//                   icon: Icons.person_add,
//                   title: 'New user registered',
//                   subtitle: 'John Doe joined the platform',
//                   time: '2 minutes ago',
//                   color: Colors.blue,
//                 ),
//                 ActivityItem(
//                   icon: Icons.shopping_cart,
//                   title: 'New order placed',
//                   subtitle: 'Order #12345 - \$129.99',
//                   time: '5 minutes ago',
//                   color: Colors.green,
//                 ),
//                 ActivityItem(
//                   icon: Icons.warning,
//                   title: 'System alert',
//                   subtitle: 'Server response time increased',
//                   time: '10 minutes ago',
//                   color: Colors.orange,
//                 ),
//                 ActivityItem(
//                   icon: Icons.payment,
//                   title: 'Payment processed',
//                   subtitle: 'Transaction #98765 completed',
//                   time: '15 minutes ago',
//                   color: Colors.purple,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
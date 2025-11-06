import 'package:axiom_admin/model/property_model.dart';
import 'package:flutter/material.dart';

class SellActionButton extends StatelessWidget {
  final Property property;
  final void Function(Property) onView;
  final void Function(Property) onApprove;
  final void Function(Property) onReject;
  final void Function(Property) onDelete;

  const SellActionButton({
    super.key,
    required this.property,
    required this.onView,
    required this.onApprove,
    required this.onReject,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => onView(property),
          icon: const Icon(Icons.visibility_outlined),
          iconSize: 18,
          color: const Color(0xFF64748B),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'approve':
                onApprove(property);
                break;
              case 'reject':
                onReject(property);
                break;
              case 'delete':
                onDelete(property);
                break;
            }
          },
          icon: const Icon(Icons.more_vert, size: 18, color: Color(0xFF64748B)),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'approve', child: Text('Approve')),
            const PopupMenuItem(value: 'reject', child: Text('Reject')),
            const PopupMenuDivider(),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      ],
    );
  }
}

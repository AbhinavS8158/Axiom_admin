import 'package:axiom_admin/model/property_model.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final Property property;
  final void Function(Property) onView;
  
  final void Function(Property) onDelete;

  const ActionButtons({
    super.key,
    required this.property,
    required this.onView,
   
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
           if(value=='delete'){
              onDelete(property);
           }
          },
          icon: const Icon(Icons.more_vert, size: 18, color: Color(0xFF64748B)),
          itemBuilder: (context) => [
            const PopupMenuDivider(),
            const PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
      ],
    );
  }
}

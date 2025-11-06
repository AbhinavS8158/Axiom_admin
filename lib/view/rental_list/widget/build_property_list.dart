import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/rental_list/widget/rent_property_details.dart';
import 'package:axiom_admin/view/rental_list/widget/rental_property_row.dart';
import 'package:flutter/material.dart';

class PropertyListTable extends StatelessWidget {
  final List<Property> properties;
  const PropertyListTable({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: Row(
              children: [
                const Text(
                  'Property Submissions',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const Spacer(),
                Text(
                  '${properties.length} items',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: const Row(
              children: [
                Expanded(flex: 4, child: Text('Name', style: headerStyle)),
                Expanded(flex: 2, child: Text('About', style: headerStyle)),
                Expanded(flex: 2, child: Text('Type', style: headerStyle)),
                Expanded(flex: 1, child: Text('Status', style: headerStyle)),
                SizedBox(
                  width: 112,
                  child: Text('Actions', style: headerStyle),
                ),
              ],
            ),
          ),

          // Property Rows
          ...properties.asMap().entries.map((entry) {
            final index = entry.key;
            final property = entry.value;
            return RentalPropertyRow(
              property: property,
              isLast:index==properties.length-1 ,
              cellStyle: cellStyle,
              onView: _viewProperty,
            );
          }),
        ],
      ),
    );
  }
void _viewProperty(BuildContext context, Property property) {
  showDialog(
    context: context,
    builder: (_) => RentPropertyDetails(property: property),
  );
}




  static const headerStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Color(0xFF475569),
    letterSpacing: 0.5,
  );

  static const cellStyle = TextStyle(
    fontSize: 14,
    color: Color(0xFF334155),
    fontWeight: FontWeight.w500,
  );
}

import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_bloc.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_event.dart';
import 'package:axiom_admin/view/rental_list/widget/action_button.dart';
import 'package:axiom_admin/view/rental_list/widget/status_chip.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_bloc.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentalPropertyRow extends StatelessWidget {
  final Property property;
  final bool isLast;
  final TextStyle cellStyle;
  final void Function(BuildContext, Property) onView;

  const RentalPropertyRow({
    Key? key,
    required this.property,
    required this.isLast,
    required this.cellStyle,
    required this.onView,
  }) : super(key: key);

  void _deleteProperty(BuildContext context, Property property) {
    context.read<PropertyBloc>().add(DeleteProperty(property));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onView(context, property),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: isLast
                ? BorderSide.none
                : const BorderSide(color: Color(0xFFF1F5F9)),
          ),
        ),
        child: Row(
          children: [
            // 🏠 Property Info Section
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  // Property Image
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF1F5F9),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        property.imageUrl.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.home_outlined,
                          color: Color(0xFF64748B),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Property Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E293B),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Color(0xFF64748B),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                property.location,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee_sharp,
                              size: 14,
                              color: Color(0xFF2563EB),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              property.price,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2563EB),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 🏘️ About Section
            Expanded(
              flex: 2,
              child: Text(
                property.about,
                style: cellStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
              Expanded(
              flex: 2,
              child: Text(
                property.about,
                style: cellStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // 🛏️ Type & Rooms
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.type, style: cellStyle),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Icon(
                        Icons.bedroom_parent_outlined,
                        size: 14,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        property.bedrooms.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.bathtub_outlined,
                        size: 14,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        property.bathrooms.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 🟩 Status
            Expanded(
              flex: 1,
              child: BlocBuilder<SelllistblocBloc, SelllistblocState>(
                builder: (context, state) {
                  if (state is SellPropertyLoaded) {
                    final updatedProperty = state.properties.firstWhere(
                      (p) => p.id == property.id,
                      orElse: () => property,
                    );
                    return StatusChip(status: updatedProperty.status);
                  } else {
                    return StatusChip(status: property.status);
                  }
                },
              ),
            ),

            // ⚙️ Actions
            const SizedBox(width: 8),
            SizedBox(
              width: 112,
              child: ActionButtons(
                property: property,
                onView: (p) => onView(context, p),
                onDelete: (p) => _deleteProperty(context, p),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

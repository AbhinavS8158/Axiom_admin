import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_bloc.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_event.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_state.dart';
import 'package:axiom_admin/view/pg/widgets/pg_status_chip.dart';
import 'package:axiom_admin/view/rental_list/widget/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PgPropertyRow extends StatelessWidget {
  final Property property;
  final bool isLast;
  final TextStyle cellStyle;
  final void Function(BuildContext, Property) viewProperty;

  const PgPropertyRow({
    Key? key,
    required this.property,
    required this.isLast,
    required this.cellStyle,
    required this.viewProperty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewProperty(context, property),
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
            // 🏠 Property Info
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  // 🖼️ Image
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
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.home_outlined,
                                color: Color(0xFF64748B), size: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // 📋 Details
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

            // 📖 About
            Expanded(
              flex: 2,
              child: Text(
                property.about,
                style: cellStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // 🏡 Type & Rooms
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

            // 🟢 Status (with Bloc)
            Expanded(
              flex: 1,
              child: BlocBuilder<PglistBloc, PglistState>(
                builder: (context, state) {
                  if (state is PgPropertyLoaded) {
                    final updatedProperty = state.properties.firstWhere(
                      (p) => p.id == property.id,
                      orElse: () => property,
                    );
                    return PgStatusChip(status: updatedProperty.status);
                  } else {
                    return PgStatusChip(status: property.status);
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
                onView: (p) => viewProperty(context, p),
                onDelete: (p) {
                  context.read<PglistBloc>().add(PgPropertyDelete(p));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

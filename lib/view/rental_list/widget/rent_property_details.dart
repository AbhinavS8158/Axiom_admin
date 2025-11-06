import 'dart:developer';

import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_bloc.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentPropertyDetails extends StatelessWidget {
  final Property property;

  const RentPropertyDetails({
    Key? key,
    required this.property,
  }) : super(key: key);

  /// 🖼️ Full-screen image preview
  void _showImagePreview(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Center(
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Colors.white,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image_outlined,
                        size: 80,
                        color: Colors.white54,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Failed to load image',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.home, color: Color(0xFF2563EB)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              property.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
        ],
      ),
      content: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📷 Property Image (Tap to preview)
               if (property.imageUrl.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: property.imageUrl.length,
                    itemBuilder: (context, index) {
                      final image = property.imageUrl[index];
                      return GestureDetector(
                        onTap: () => _showImagePreview(context, image),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              image,
                              width: 300,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                width: 300,
                                color: const Color(0xFFF1F5F9),
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image_outlined,
                                    size: 50,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 50,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),

              const SizedBox(height: 16),
              // 🏠 Property Details
              _buildDetailRow("Location", property.location, Icons.location_on_outlined),
              _buildDetailRow("Price", property.price, Icons.attach_money),
              _buildDetailRow("About", property.about, Icons.info_outline),
              _buildDetailRow("Type", property.type, Icons.home_work_outlined),
              _buildDetailRow("Bedrooms", property.bedrooms.toString(), Icons.bedroom_parent_outlined),
              _buildDetailRow("Bathrooms", property.bathrooms.toString(), Icons.bathtub_outlined),
              _buildDetailRow("Phone", property.phone, Icons.phone_outlined),
              _buildDetailRow("Email", property.email, Icons.email_outlined),
              _buildDetailRow("Status", property.status, Icons.circle,
                  statusColor: _getStatusColor(property.status)),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Close",
            style: TextStyle(color: Color(0xFF64748B)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<PropertyBloc>().add(ApproveProperty(property));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text('Approve'),
        ),
        ElevatedButton(
          onPressed: () {
            log('Reject button pressed for ${property.id}');
            context.read<PropertyBloc>().add(RejectProperty(property));
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
          ),
          child: const Text('Reject'),
        ),
      ],
    );
  }

  /// 🧱 Helper for info rows
  Widget _buildDetailRow(String label, String value, IconData icon, {Color? statusColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: statusColor ?? const Color(0xFF64748B)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: statusColor ?? const Color(0xFF1E293B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🎨 Status color helper
  static Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.redAccent;
      case 'pending':
        return Colors.orange;
      default:
        return const Color(0xFF475569);
    }
  }
}

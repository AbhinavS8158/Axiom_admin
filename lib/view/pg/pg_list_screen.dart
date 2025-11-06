import 'dart:developer';

import 'package:axiom_admin/controller/services/firestore_services.dart';
import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/pg/widgets/pg_property_list.dart';
import 'package:flutter/material.dart';

class PgListScreen extends StatelessWidget {
  PgListScreen({super.key});

  final FirestoreServices _firestoreServices = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Property Management',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<List<Property>>(
        stream: _firestoreServices.fetchPgProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final properties = snapshot.data ?? [];
          log('-----------------------$properties.toString()');

          if (properties.isEmpty) {
            return const Center(child: Text("No data"));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Review and manage property submissions',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  PgPropertyList(properties: properties),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:axiom_admin/controller/services/firestore_services.dart';
import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_bloc.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_event.dart';
import 'package:axiom_admin/view/seller_list/widgets/sell_property_list_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellListScreen extends StatelessWidget {
  SellListScreen({super.key});

  final FirestoreServices _firestoreServices = FirestoreServices();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelllistblocBloc()..add(SellFetchProperties()),
      child: Scaffold(
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
          stream: _firestoreServices.fetchsellProperties(),
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
            log(properties.toString());
      
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
                    SellPropertyListTable(properties: properties),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

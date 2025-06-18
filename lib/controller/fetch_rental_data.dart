
import 'dart:developer';

import 'package:axiom_admin/model/property_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



Future<List<Propertycardmodel>> fetchRentalProperties() async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('rent_property').get();

    return snapshot.docs.map((doc) {
      return Propertycardmodel.fromMap(doc.data(), doc.id);
    }).toList();
  } catch (e) {
    log('Error: $e');
    return [];
  }
}

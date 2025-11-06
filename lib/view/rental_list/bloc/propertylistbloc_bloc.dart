import 'dart:developer';

import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_event.dart';
import 'package:axiom_admin/view/rental_list/bloc/propertylistbloc_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PropertyBloc() : super(PropertyInitial()) {
    on<FetchProperties>((event, emit) async {
      emit(PropertyLoading());
      try {
       
        await Future.delayed(const Duration(seconds: 1)); // dummy delay
        final properties = <Property>[]; // replace with your fetched list
        emit(PropertyLoaded(properties));
      } catch (e) {
        emit(PropertyError(e.toString()));
      }
    });

  on<ApproveProperty>((event, emit) async {
  try {
      await FirebaseFirestore.instance
            .collection('rent_property')
            .doc(event.property.id)
            .update({'status': '1'});

        log('Approved property: ${event.property.title}');
        emit(PropertyActionSuccess('Property approved successfully.'));
        add(FetchProperties()); // refresh list after approval
  } catch (e) {
    emit(PropertyError('Failed to update status: ${e.toString()}'));
  }
});
on<RejectProperty>((event, emit) async {
  log('RejectProperty event received for ${event.property.id}');
  try {
    await FirebaseFirestore.instance
        .collection('rent_property')
        .doc(event.property.id)
        .update({'status': '2'});

    log('Rejected property: ${event.property.title}');
    emit(PropertyActionSuccess('Property Rejected successfully.'));
    add(FetchProperties());
  } catch (e) {
    log('Error rejecting property: $e');
    emit(PropertyError('Failed to update status: ${e.toString()}'));
  }
});
on<DeleteProperty>((event,emit)async{
  log('DeleteProperty event recived for ${event.property.id}');
  try{
    await FirebaseFirestore.instance.collection('rent_property').doc(event.property.id).delete();
    log ('Deleted property:${event.property.title}');
    emit(PropertyActionSuccess('Property Deleted Successfully'));
  }catch (e) {
    log('Error deleteing property: $e');
    emit(PropertyError('Failed to update status: ${e.toString()}'));
  }
});

  }
}

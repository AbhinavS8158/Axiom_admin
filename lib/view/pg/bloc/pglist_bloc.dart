import 'dart:developer';

import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_event.dart';
import 'package:axiom_admin/view/pg/bloc/pglist_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PglistBloc extends Bloc<PglistEvent, PglistState> {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PglistBloc() : super(PgPropertyInitial()) {
    on<PgFetchProperties>((event, emit) async {
      emit(PgPropertyLoading());
      try {
       
        await Future.delayed(const Duration(seconds: 1)); // dummy delay
        final properties = <Property>[]; // replace with your fetched list
        emit(PgPropertyLoaded(properties));
      } catch (e) {
        emit(PgPropertyError(e.toString()));
      }
    });

  on<PgApproveProperty>((event, emit) async {
  try {
      await FirebaseFirestore.instance
            .collection('pg_property')
            .doc(event.property.id)
            .update({'status': '1'});

        log('Approved property: ${event.property.title}');
        emit(PgPropertyActionSuccess('Property approved successfully.'));
        add(PgFetchProperties()); // refresh list after approval
  } catch (e) {
    emit(PgPropertyError('Failed to update status: ${e.toString()}'));
  }
});
on<PgRejectProperty>((event, emit) async {
  log('RejectProperty event received for ${event.property.id}');
  try {
    await FirebaseFirestore.instance
        .collection('pg_property')
        .doc(event.property.id)
        .update({'status': '2'});

    log('Rejected property: ${event.property.title}');
    emit(PgPropertyActionSuccess('Property Rejected successfully.'));
    add(PgFetchProperties());
  } catch (e) {
    log('Error rejecting property: $e');
    emit(PgPropertyError('Failed to update status: ${e.toString()}'));
  }
});
on<PgPropertyDelete>((event,emit)async{
  log('DeleteProperty event received for ${event.property.id}');
  try{
    await FirebaseFirestore.instance.collection('pg_property').doc(event.property.id).delete();
    log('Deteled Property ${event.property.title}');
    emit(PgPropertyActionSuccess('Property Deleted successfully'));
  }catch(e){
    log('Error Deleting property:$e ');
    emit(PgPropertyError('Failed to delete :${e.toString()}'));
  }
});

  }
}

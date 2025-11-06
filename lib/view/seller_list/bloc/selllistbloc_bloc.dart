import 'dart:developer';

import 'package:axiom_admin/model/property_model.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_event.dart';
import 'package:axiom_admin/view/seller_list/bloc/selllistbloc_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelllistblocBloc extends Bloc<SelllistblocEvent, SelllistblocState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SelllistblocBloc() : super(SellPropertyInitial()) {
    on<SellFetchProperties>((event, emit) async {
      emit(SellPropertyLoading());
      try {
        await Future.delayed(const Duration(seconds: 1)); // Dummy delay

      

        final properties =<Property>[];

        emit(SellPropertyLoaded(properties));
      } catch (e) {
        emit(SellPropertyError('Failed to fetch properties: $e'));
      }
    });

    on<SellApproveProperty>((event, emit) async {
      try {
        await _firestore
            .collection('sell_property')
            .doc(event.property.id)
            .update({'status': '1'});

        log('Approved property: ${event.property.title}');
        emit(SellPropertyActionSuccess('Property approved successfully.'));
        add(SellFetchProperties());
      } catch (e) {
        emit(SellPropertyError('Failed to update status: ${e.toString()}'));
      }
    });

    on<SellRejectProperty>((event, emit) async {
      log('RejectProperty event received for ${event.property.id}');
      try {
        await _firestore
            .collection('sell_property')
            .doc(event.property.id)
            .update({'status': '2'});

        log('Rejected property: ${event.property.title}');
        emit(SellPropertyActionSuccess('Property rejected successfully.'));
        add(SellFetchProperties());
      } catch (e) {
        log('Error rejecting property: $e');
        emit(SellPropertyError('Failed to update status: ${e.toString()}'));
      }
    });
    on<SellPropertyDelete>((event,emit)async{
      log('DeleteProperty event recived for ${event.property.id}');
      try{
        await _firestore
        .collection('sell_property').doc(event.property.id).delete();
      }catch(e){
        log("Error Deleting Property:$e");
        emit (SellPropertyError('Failed to update status:${e.toString()}'));
      }
    });
  }
}

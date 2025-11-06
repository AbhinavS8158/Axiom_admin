import 'package:axiom_admin/model/property_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;




  // Stream for rent properties
  Stream<List<Property>> fetchProperties() {
    return _firestore.collection('rent_property').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Property.fromMap(data, doc.id);
      }).toList();
    });
  }

  // Stream for sell properties
  Stream<List<Property>> fetchsellProperties() {
    return _firestore.collection('sell_property').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Property.fromMap(data, doc.id);
      }).toList();
    });
  }

  // Future for PG properties (if no real-time updates needed)
  Stream<List<Property>> fetchPgProperties()  {

   return _firestore.collection('pg_property').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Property.fromMap(data, doc.id);
      }).toList();
    });
  }

    Stream<Map<String, int>> getStatsStream() {
    final rentalsStream = _firestore.collection('rent_property').snapshots();
    final sellersStream = _firestore.collection('sell_property').snapshots();
    final pgsStream = _firestore.collection('pg_property').snapshots();

    return Rx.combineLatest3( 
      rentalsStream,
      sellersStream,
      pgsStream,
      (rentalSnap, sellerSnap, pgSnap) {
        return {
          'rentals': rentalSnap.docs.length,
          'sellers': sellerSnap.docs.length,
          'pgs': pgSnap.docs.length,
        };
      },
    );
  }

}

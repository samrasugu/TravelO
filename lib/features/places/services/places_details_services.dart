import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelo/common/widgets/snack_bar.dart';
import 'package:travelo/features/auth/services/auth_services.dart';

class PlaceDetailsServices {
  final _fireStore = FirebaseFirestore.instance;

  // fetch single place data
  Future<List?> fetchPlaceDetails(
      {required BuildContext context, required String place}) async {
    List? placeData = [];

    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('places')
          .where('name', isEqualTo: place)
          .limit(1)
          .get();
      placeData = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    // print(placeData);
    return placeData;
  }

  // rate place
  Future<void> ratePlace({
    required BuildContext context,
    required String place,
    required double rating,
  }) async {
    final user = context.read<AuthServices>().user;
    String? placeId;
    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('places')
          .where('name', isEqualTo: place)
          .get();
      // placeId = querySnapshot.docs.map((doc) => doc.id);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}

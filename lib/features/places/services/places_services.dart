import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/snack_bar.dart';

class PlaceDetailsServices {
  final _fireStore = FirebaseFirestore.instance;
  Future<List?> fetchPlaceDetails(
      {required BuildContext context, required String place}) async {
    List? placeData = [];

    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('places')
          .where('name', isEqualTo: place).limit(1)
          .get();
      // final docRef = _fireStore.collection('places').where(
      //       'name',
      //       isEqualTo: place,
      //     ).get();

      // docRef.get().then((doc) {
      // final placeData = docRef.data() as Map<String, dynamic>;
      // });
      placeData = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    print(placeData);
    return placeData;
  }
}

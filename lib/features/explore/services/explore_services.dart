import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/snack_bar.dart';

class ExploreServices {
  final _fireStore = FirebaseFirestore.instance;
  Future<List?> fetchPlaces(BuildContext context) async {
    List? placesList = [];

    try {
      QuerySnapshot querySnapshot = await _fireStore.collection('places').get();
      placesList = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return placesList;
  }
}
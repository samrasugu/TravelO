import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/snack_bar.dart';

class SearchServices {
  final _fireStore = FirebaseFirestore.instance;
  // fetch searched places
  Future<List?> fetchSearched(
      {required BuildContext context, required String place}) async {
    List? places = [];

    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('places')
          .where('name', isEqualTo: place)
          .get();
      places = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return places;
  }
}

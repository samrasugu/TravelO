import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/snack_bar.dart';

class CategoryServices {
  final _fireStore = FirebaseFirestore.instance;
  // fetch category data
  Future<List?> fetchPlaces({
    required BuildContext context,
    required String category,
  }) async {
    List? placesData = [];
    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection('places')
          .where('category', isEqualTo: category)
          .get();
      placesData = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    print(placesData);
    return placesData;
  }
}

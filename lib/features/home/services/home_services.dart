import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelo/common/widgets/snack_bar.dart';

class HomeServices {
  final _fireStore = FirebaseFirestore.instance;
  Future<List?> fetchPlaces(BuildContext context) async {
    List? placesList = [];
    List? placesId = [];

    try {
      QuerySnapshot querySnapshot =
          await _fireStore.collection('places').limit(2).get();
      placesList = querySnapshot.docs.map((doc) => doc.data()).toList();

      QuerySnapshot docIdSnapshot =
          await _fireStore.collection('places').limit(2).get();
      placesId = docIdSnapshot.docs.map((doc) => doc.id).toList();
      print(placesId);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return placesList;
  }

  // fetch categories
  Future<List?> fetchCategories(BuildContext context) async {
    List? categoriesList = [];

    try {
      QuerySnapshot querySnapshot =
          await _fireStore.collection("categories").get();
      categoriesList = querySnapshot.docs.map((doc) => doc.data()).toList();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
    return categoriesList;
  }
}

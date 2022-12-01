import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelo/common/widgets/snack_bar.dart';
import 'package:travelo/features/auth/services/auth_services.dart';

class LikeService {
  final _firestore = FirebaseFirestore.instance;
  // like place service
  Future<void> likePlace({
    required BuildContext context,
    required String place,
  }) async {
    final user = context.read<AuthServices>().user;
    String? placeId;
    try {
      // add place to user's document
      await _firestore.collection("users").doc(user.uid).update({
        "likedplaces": FieldValue.arrayUnion([place]),
      });

      // check if user has liked place
      bool isLiked;
      List? userData;
      final userDocRef = _firestore.collection("users").doc(user.uid);
      userDocRef.get().then((DocumentSnapshot doc) {
        final userData = doc.data() as Map<String, dynamic>;
      }, onError: (e) {
        showSnackBar(context, e.message!);
      });

      if (userData?[0]['likedplaces']) {}

      // QuerySnapshot querySnapshot = await _firestore
      //     .collection("places")
      //     .limit(1)
      //     .where("name", isEqualTo: place)
      //     .get();
      // placeId = querySnapshot.docs.map((doc) => doc.id).toString();
      // var placeRef = _firestore.collection("places").doc(placeId);
      // placeRef.update({
      //   "likes": FieldValue.increment(1),
      // });
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}

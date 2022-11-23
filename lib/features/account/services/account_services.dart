import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travelo/common/widgets/snack_bar.dart';
import 'package:travelo/features/auth/services/auth_services.dart';

class AccountServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _fireStore = FirebaseStorage.instance;
  // profile image upload
  Future<String?> uploadImage(BuildContext context) async {
    final user = context.read<AuthServices>().user;

    String? imageURL;

    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (image == null) {
        showSnackBar(context, 'No image selected');
      }

      final imageTemp = File(image!.path);

      final filename = user.uid;

      // upload image
      var snaphsot =
          await _fireStore.ref().child('users/$filename').putFile(imageTemp);
      var downloadURL = await snaphsot.ref.getDownloadURL();
      await user.updatePhotoURL(downloadURL);

      imageURL = await snaphsot.ref.getDownloadURL();
    } on PlatformException catch (e) {
      showSnackBar(context, e.message!);
    }

    return imageURL;
  }

  // update displayName and email
  Future<void> updateDetails({
    required BuildContext context,
    String? displayName,
    String? email,
  }) async {
    final user = context.read<AuthServices>().user;
    try {
      if (displayName != "" && email != "") {
        await user.updateEmail(email!);
        await user.updateDisplayName(displayName);
        await sendEmailVerification(context);
      } else if (displayName == "") {
        await user.updateEmail(email!);
      } else if (email == "") {
        await user.updateDisplayName(displayName);
        await sendEmailVerification(context);
      } else {
        showSnackBar(context, 'Add details to update!');
      }
      showSnackBar(context, 'Profile Updated!');
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // send email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}

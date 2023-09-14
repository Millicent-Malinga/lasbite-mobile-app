import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String childName, Uint8List image, bool isPost) async {
    Reference reff =
        _storage.ref().child(childName).child(_auth.currentUser!.uid + '/');

    UploadTask uploadTask = reff.putData(image, SettableMetadata(contentType: 'image/jpeg'));

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    print('success');
    return downloadUrl;
  }
}

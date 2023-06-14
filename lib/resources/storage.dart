import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; //same like storage_ mean private
  final FirebaseStorage _storage = FirebaseStorage
      .instance; // firebasestorge is a class provide by firebase _storage var store the class instance

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      //
      String childName,
      Uint8List file,
      bool isPost) async {
    //async ==asyncronize==let execute futher code
    // creating location to our firebase storage

    Reference ref =
        await _storage //await tell us to wait as it may take time to execute so proceed futher commands....its always used with future and async always with awiat
            .ref()
            .child(childName) //child create a folder with name of childname
            .child(_auth.currentUser!
                .uid); //ref=ref to already exist file or not ///this chid will create a different folder with uinique userid for various user

    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // putting in uint8list format -> Upload task like a future but not future
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

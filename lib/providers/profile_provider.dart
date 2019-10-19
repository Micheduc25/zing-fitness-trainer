import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profile_model.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';
class ProfileProvider extends ChangeNotifier{

  Firestore _firestore ;
  FirebaseStorage storage;

  ProfileProvider.instance() : _firestore = Firestore.instance,
        storage = FirebaseStorage.instance;




  Future<String> uploadImage(var imageFile) async {


    var uuid = Uuid().v1();
    StorageReference ref = storage.ref().child(Config.users).child("profile_$uuid.jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

    StorageTaskSnapshot storageTask = await uploadTask.onComplete;
    String downloadUrl = await storageTask.ref.getDownloadURL();
    print(downloadUrl);
    return downloadUrl;


  }

  Future<void> saveUserData(String userId,Map userDataMap){

    return _firestore.collection(Config.users).document(userId).setData(userDataMap,merge: true).then((_){
      print("successful");
    });
  }


  /// Get a stream of a single profile document
  Stream<ProfileModel> streamSingleUserProfile(String userId) {
    return _firestore
        .collection(Config.users).document(userId)

        .snapshots()

        .map((snap) {
      print(snap.data.toString());
      return ProfileModel.fromFirestore(snap);
    });
  }



}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

class TrainerProfileModel{
  String userId;
  String name;
  String phoneNumber;
  String serviceArea;
  String experience;
  String sessionRate;
  String profilePicUrl;
  String speciality;

  TrainerProfileModel({this.userId,this.profilePicUrl, this.name, this.phoneNumber, this.serviceArea,
      this.experience, this.sessionRate, this.speciality});


  factory TrainerProfileModel.fromFirestore(DocumentSnapshot docSnapShot){

    return TrainerProfileModel(
      userId: docSnapShot.data[Config.userId],
      name: docSnapShot.data[Config.fullNames],
      phoneNumber: docSnapShot.data[Config.phone],
      profilePicUrl: docSnapShot.data[Config.profilePicUrl]


    );
  }


}
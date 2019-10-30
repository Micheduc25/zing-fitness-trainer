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
  String height,age,weight,email,location;


  TrainerProfileModel({this.userId, this.name, this.phoneNumber,
      this.serviceArea, this.experience, this.sessionRate, this.profilePicUrl,
      this.speciality, this.height, this.age, this.weight,this.email,this.location});

  factory TrainerProfileModel.fromFirestore(DocumentSnapshot docSnapShot){

    return TrainerProfileModel(
      userId: docSnapShot.data[Config.userId],
      name: docSnapShot.data[Config.fullNames],
      email: docSnapShot.data[Config.email],
      phoneNumber: docSnapShot.data[Config.phone]??"",
      profilePicUrl: docSnapShot.data[Config.profilePicUrl]??"",
      height: docSnapShot.data[Config.height]??"",
      age: docSnapShot.data[Config.age]??"",
      weight: docSnapShot.data[Config.weight]??"",
      speciality: docSnapShot.data[Config.speciality]??"",
      sessionRate: docSnapShot.data[Config.sessionRate]??"",
      experience: docSnapShot.data[Config.experience]??"",
      serviceArea: docSnapShot.data[Config.serviceArea]??"",
      location: docSnapShot.data[Config.location]??"",




    );
  }


}
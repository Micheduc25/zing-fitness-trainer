import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

class UserCertificateModel{
  String certId;

  UserCertificateModel({this.certId});

  factory UserCertificateModel.fromFirestore(DocumentSnapshot docSnap){
    return UserCertificateModel(
      certId: docSnap.data[Config.certId]
    );
  }


}
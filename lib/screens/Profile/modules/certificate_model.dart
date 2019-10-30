import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

class CertificateModel {
  String certId,certName,certUrl,userId;
  Timestamp createdOn;

  CertificateModel({this.certId, this.certName, this.certUrl, this.userId,this.createdOn});


  factory CertificateModel.fromFirestore(DocumentSnapshot docSnap){
    return CertificateModel(
      certId: docSnap.data[Config.certId],
      userId:docSnap.data[Config.userId],
      certName: docSnap.data[Config.certName],
      certUrl: docSnap.data[Config.certUrl],
      createdOn: docSnap.data[Config.createdOn]
    );
  }

}
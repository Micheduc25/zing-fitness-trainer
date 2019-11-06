import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

class MessageModel {
  String message;
  String time;
  String from;

  MessageModel({this.message, this.time, this.from});

  factory MessageModel.fromFirestore(DocumentSnapshot docSnapShot) {
    return MessageModel(
        message: docSnapShot.data[Config.message],
        time: docSnapShot.data[Config.time],
        from: docSnapShot.data[Config.from]);
  }
}

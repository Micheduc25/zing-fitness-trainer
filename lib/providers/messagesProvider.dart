import 'package:flutter/foundation.dart';

class MessageData with ChangeNotifier {
  var messageList = [
    //these two guys are test samples for  "me" and "other"
    {"content": "Hello guys am greeting", "time": "02:30 AM", 'from': "me"},
    {"content": "Am greeting too", "time": "02:32 AM", 'from': "other"}
  ];

  get getMessages => this.messageList;

  getAMessage(int index) {
    return this.messageList[index];
  }

  addMessage(message) {
    this.messageList.add(message);
    notifyListeners();
  }

  get messagesLength => this.messageList.length;
}

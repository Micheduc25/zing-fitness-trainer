import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/messagesProvider.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ChatBar extends StatefulWidget {
  @override
  _ChatBarState createState() => new _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final myText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors().chatBlue,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) => Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ////////////////////////////////////////////////// the text input here
            Container(
              width: constraints.maxWidth * 0.84,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              decoration: BoxDecoration(
                  color: MyColors().inputWhite,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TextField(
                controller: myText,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.attach_file,
                    color: MyColors().deepBlue,
                  ),
                  hintText: "Type Message...",
                  hintStyle:
                      TextStyle(color: MyColors().deepBlue, fontSize: 13),
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ),
            //////////////////////////////////////////////////////////////
            ///
            ///the send icon here
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  color: MyColors().deepBlue,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              child: IconButton(
                icon: Icon(Icons.send),
                color: MyColors().white,
                onPressed: () {
                  _sendMessage(myText.text, timeString(), "me");
                  myText.clear();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

//This function's role is to simulate message sending
//it will be modified later
//we take the message time and sender
  _sendMessage(String message, String time, String from) {
    var data = Provider.of<MessageData>(context);

    data.addMessage({'content': message, 'time': time, 'from': from});
  }

//this function puts the current time in the required format for display in the speech bubbles.
  String timeString() {
    var hour = DateTime.now().hour;
    var period = hour > 11 ? "PM" : "AM";

    var englishHour = hour % 12.floor();
    var minutes = DateTime.now().minute;

    var minuteExtraZero = minutes < 10 ? "0" : "";
    var hourExtraZero = englishHour < 10 ? "0" : "";

    return "$hourExtraZero$englishHour:$minuteExtraZero$minutes $period";
  }
}

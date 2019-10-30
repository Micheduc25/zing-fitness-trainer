
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final int noMsg;
  final String imageLink;
  final String time;
  @override
  ChatItem(
      {Key key,
      @required this.name,
      @required this.lastMessage,
      this.time,
      this.noMsg,
      this.imageLink})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(5),
      leading: CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage("assets/images/" + this.imageLink),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              this.name,
              style: TextStyle(fontSize: 13),
            ),
          ),
          RichText(
            text: TextSpan(
              text: this.lastMessage,
              style: TextStyle(color: MyColors().deepBlue, fontSize: 12),
            ),
          ),
        ],
      ),
      trailing: Column(
        children: <Widget>[
          Text(
            this.time,
            style: TextStyle(color: MyColors().textBlack, fontSize: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                this.noMsg.toString(),
                style: TextStyle(
                    color: MyColors().deepBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.w900),
              ),


          )
        ],
      ),
    );
  }
}

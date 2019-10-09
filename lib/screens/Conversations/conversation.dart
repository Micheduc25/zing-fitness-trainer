import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/components/chatItem.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class Conversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Conversations",
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyColors().deepBlue,
            child: Icon(Icons.message),
            onPressed: () {
              print("Hello");
            },
          ),
          drawer: MyDrawer(),
          appBar: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
            backgroundColor: MyColors().white,
            title: Center(
              child: Text(
                "Conversations",
                style: TextStyle(
                    color: MyColors().deepBlue, fontWeight: FontWeight.w900),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          body: ConversationBody(),
        ));
  }
}

class ConversationBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors().white,
      child: ListView(
        children: <Widget>[
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
          Divider(),
          ChatItem(
            lastMessage: "are you planning any work out",
            name: "Ndjock Junior",
            time: "09:27 AM",
            noMsg: 2,
            imageLink: "me.jpg",
          ),
        ],
      ),
    );
  }
}

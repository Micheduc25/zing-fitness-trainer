import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/chatBubble.dart';
import 'package:zing_fitnes_trainer/providers/messagesProvider.dart';
import 'package:zing_fitnes_trainer/screens/chat_page/modules/chatbar.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chat Page",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Chat"),
            centerTitle: true,
            backgroundColor: MyColors().skyBlue,
            elevation: 5,
            automaticallyImplyLeading: true,
            actions: <Widget>[
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("One"),
                      value: "one",
                    ),
                    PopupMenuItem(
                      child: Text("Two"),
                      value: "two",
                    )
                  ];
                },
              )
            ],
          ),
          body: ChatPageHome(),
        ));
  }
}

class ChatPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = MyColors();
    var size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => MessageData(),
        )
      ],
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: colors.skyBlue,
          ),
          child: Column(
            children: <Widget>[
              //the chat box to come here
              //we generate chats with a listview linked to our data in the MessageData class
              //will be replaced with a stream builder in future
              Container(
                constraints: BoxConstraints(maxHeight: size.height * 0.785),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/chatBg.png"),
                        fit: BoxFit.fill)),
                child: Consumer<MessageData>(
                  builder: (context, data, _) => ListView.builder(
                    reverse: true,
                    itemCount: data.messagesLength,
                    itemBuilder: (context, index) {
                      List<Map<String, String>> messages = data
                          .getMessages; //this is a list which contain messages and their info

                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child:
                              //we use the bubble widget from the bubble package installed
                              ChatBubble(
                            //if the message is from me, the bubble is aligned to the right of the chat screen,
                            //else it is aligned to the left of the chat screen
                            alignment: bubbleAlign(messages[index]["from"]),
                            radius: Radius.circular(10),
                            nip: getNipLocation(messages[index]["from"]),
                            padding: BubbleEdges.all(10),
                            child: _messageContent(index, messages),
                            color: bubbleColor(messages[index]["from"]),
                          ));
                    },
                  ),
                ),
              ),

              //we align the chat Bar at the bottom of the stack with the align widget
              Align(alignment: Alignment.bottomCenter, child: ChatBar())
            ],
          ),
        ),
      ),
    );
  }
}

//the set of functions below generate properties corresponding to the person who sent the message(you or the other person)

BubbleNip getNipLocation(from) {
  if (from == "me") {
    return BubbleNip.rightTop;
  } else {
    return BubbleNip.leftTop;
  }
}

Color bubbleColor(from) {
  if (from == "me") {
    return MyColors().deepBlue;
  } else {
    return MyColors().white;
  }
}

Color bubbleTextColor(from) {
  if (from == "me") {
    return MyColors().white;
  } else {
    return MyColors().deepBlue;
  }
}

CrossAxisAlignment bubbleTextAlign(from) {
  if (from == "me") {
    return CrossAxisAlignment.end;
  } else {
    return CrossAxisAlignment.start;
  }
}

Alignment bubbleAlign(from) {
  if (from == "me") {
    return Alignment.topRight;
  } else {
    return Alignment.topLeft;
  }
}

//the below function return s the content of a speechbubble custmized according to the person who sent the message,
// you or the other person

Widget _messageContent(int index, List<Map<String, String>> messages) {
  var textColor = bubbleTextColor(messages[index]["from"]);
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: bubbleTextAlign(messages[index]["from"]),
      children: <Widget>[
        Text(
          messages[index]['content'],
          style: TextStyle(color: textColor),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          messages[index]['time'],
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    ),
  );
}

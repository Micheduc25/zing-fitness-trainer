import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/messagesProvider.dart';
import 'package:zing_fitnes_trainer/screens/chat_page/modules/chatbar.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chat Page",
        home: Scaffold(
          body: ChatPageHome(),
        ));
  }
}

class ChatPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = MyColors();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => MessageData(),
        )
      ],
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: colors.skyBlue,
            image: DecorationImage(
                image: AssetImage("assets/images/chatBg.png"),
                fit: BoxFit.fill)),
        child: Stack(
          children: <Widget>[
            //the chat box to come here
            //we generate chats with a listview linked to our data in the MessageData class
            //will be replaced with a stream builder in future
            Consumer<MessageData>(
              builder: (context, data, _) => ListView.builder(
                itemCount: data.messagesLength,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child:
                          //we use the bubble widget from the bubble package installed
                          Bubble(
                        //if the message is from me, the bubble is aligned to the right of the chat screen,
                        //else it is aligned to the left of the chat screen
                        alignment: bubbleAlign(data.getAMessage(index)["from"]),
                        radius: Radius.circular(10),
                        nip: getNipLocation(data.getAMessage(index)["from"]),
                        padding: BubbleEdges.all(10),
                        child: _messageContent(index, data),
                        color: bubbleColor(data.getAMessage(index)["from"]),
                      ));
                },
              ),
            ),

            //we align the chat Bar at the bottom of the stack with the align widget
            Align(alignment: Alignment.bottomCenter, child: ChatBar())
          ],
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

Widget _messageContent(int index, MessageData data) {
  var textColor = bubbleTextColor(data.getAMessage(index)["from"]);
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: bubbleTextAlign(data.getAMessage(index)["from"]),
      children: <Widget>[
        Text(
          data.getAMessage(index)['content'],
          style: TextStyle(color: textColor),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          data.getAMessage(index)['time'],
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class InfoDialogue extends StatelessWidget {
  final String title;
  final Map<String, String> values;

  InfoDialogue({Key key, this.title, this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //we create a list containin all of our fields and their values.
    List<Widget> mywidgets = [];
    this.values.forEach((key, value) => {
          mywidgets.add(RichText(
            text: TextSpan(
                text: "$key : $value",
                style: TextStyle(color: MyColors().white)),
          )),
          mywidgets.add(Padding(
            padding: EdgeInsets.only(bottom: 10),
          ))
        });
    return SimpleDialog(
      backgroundColor: MyColors().skyBlue,
      title: Text(
        this.title,
        style: TextStyle(color: MyColors().white),
      ),
      children: mywidgets,
      contentPadding: EdgeInsets.all(20),
    );
  }
}

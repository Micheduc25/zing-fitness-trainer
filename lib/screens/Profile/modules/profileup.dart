import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfileUp extends StatelessWidget {
  const ProfileUp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: MyColors().gray,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DottedBorder(
                //the image with the dotted border here
                borderType: BorderType.Circle,
                padding: EdgeInsets.all(8),
                color: MyColors().deepBlue,
                strokeWidth: 2,
                dashPattern: [5, 8],
                child: CircleAvatar(
                  maxRadius: 40,
                  backgroundImage: AssetImage("assets/images/im4.png"),
                ),
              ),

              //the name and age here in a column

              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Zhenya Rynzhuk",
                      style:
                          TextStyle(color: MyColors().textBlack, fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    ),
                    Text(
                      "Age:24  Sex:Female",
                      style:
                          TextStyle(color: MyColors().textBlack, fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.all(3),
            alignment: Alignment.topRight,
            icon: Icon(
              Icons.settings,
              color: MyColors().deepBlue,
              size: 15,
            ),
            onPressed: () {
              print("icon pressed");
            },
          ),
        ],
      ),
    );
  }
}

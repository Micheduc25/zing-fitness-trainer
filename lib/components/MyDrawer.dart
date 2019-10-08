import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerBody();
  }
}

class DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colors = new MyColors();
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      color: colors.deepBlue,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage("assets/images/runningMan.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Zhenya Rynzhuk"),
              )
            ],
          )
        ],
      ),
    );
  }
}

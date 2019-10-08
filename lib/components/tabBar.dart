import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/provider.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  BorderRadius activeRadius = BorderRadius.only(
      topLeft: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      topRight: Radius.zero,
      bottomRight: Radius.zero);

  @override
  Widget build(BuildContext context) {
    var colors = MyColors();
    var mydata = Provider.of<AppBarData>(context);
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.93,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(color: colors.deepBlue, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: colors.deepBlue,
          indicatorColor: colors.deepBlue,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: colors.deepBlue,
            borderRadius: activeRadius,
          ),
          tabs: [
            Tab(
              text: "Active Session",
            ),
            Tab(
              text: "Bookings",
            )
          ],
          onTap: (index) {
            setState(() {
              if (index == 1) {
                activeRadius = BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero);

                mydata.setTitle = "Bookings";
              } else {
                activeRadius = BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.zero,
                    bottomRight: Radius.zero);
                mydata.setTitle = "Active Session";
              }
            });
          },
        ));
  }
}

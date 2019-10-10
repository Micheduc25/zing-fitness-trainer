import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileTabBar.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileup.dart';
import 'package:zing_fitnes_trainer/screens/Profile/views/tabBarviews.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Profile page",
        home: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            elevation: 0.0,
            iconTheme: IconThemeData(color: MyColors().deepBlue, size: 40),
            backgroundColor: MyColors().white,
            title: Center(
              child: Text(
                "Profile",
                style: TextStyle(
                    color: MyColors().deepBlue,
                    fontSize: 17,
                    fontWeight: FontWeight.w900),
              ),
            ),
            actions: <Widget>[
              Badge(
                padding: EdgeInsets.all(2),
                badgeColor: MyColors().notificationRed,
                badgeContent: Text(" "),
                position: BadgePosition(top: 10, right: 15),
                child: IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {
                    print("hello");
                  },
                ),
              )
            ],
          ),
          body: DefaultTabController(length: 2, child: ProfilePageBody()),
        ));
  }
}

class ProfilePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  ProfileUp(),
                  ProfileTabBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  MyViews()
                ],
              ),
            ),
            FootBgr(),
          ],
        ),
      ),
    );
  }
}

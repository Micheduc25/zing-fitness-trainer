import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/personal_details.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileTabBar.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileup.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/trainer_info.dart';
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
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //this column contains the whole body
          children: <Widget>[
            Padding(
              //this padding contains the upper part of the body and it gives some padding
              //between the screen edges and the widgets
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  //this column contains the widgets of the upper body, (all but the footer image)
                  new ProfileUp(),
                  //the gray container with the avatar(ProfileUp) ends here

                  ProfileTabBar(),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    // height: 273,
                    height: size.height * 0.4255,
                    child: MyViews(),
                  )
                ],
              ),
            ),
            FootBgr()
          ],
        ),
      ),
    );
  }
}

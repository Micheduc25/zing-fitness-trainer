import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/MyDrawer.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/pFootbg.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileTabBar.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/profileup.dart';
import 'package:zing_fitnes_trainer/screens/Profile/views/tabBarviews.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class ProfilePageRegularUser extends StatelessWidget {
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
          body:ProfilePageBodyRegularUser(),

          ),
        );
  }
}

class ProfilePageBodyRegularUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  ProfileUp(),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),

                  PersonalDetails()
              
                ],
              ),
            ),
            
            SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),

       
          FootBgr(),
       
         
          ],
        ),
      ),
    );
  }
}


class PersonalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //the gray container containing physical properties and their values
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: MyColors().gray,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _physicalItem("Height", "172 cm"),
                  _physicalItem("Weight", "63 kg"),
                  _physicalItem("HR max", "189"),
                  _physicalItem("Type", "Crossfit"),
                ],
              ),
            ),
            //container ends here,

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                detailItem("Username", "Nathan Riley"),
                Divider(
                  color: MyColors().gray,
                  thickness: 2,
                ),
                detailItem("Email Id", "zhenya@imail.com"),
                Divider(
                  color: MyColors().gray,
                  thickness: 2,
                ),
                detailItem("Mobile no", "+237 679361858"),
              ],
            )
          ]),
        ));
  }
}

Widget _physicalItem(property, value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(property, style: TextStyle(fontSize: 12)),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
      ),
      Text(value,
          style: TextStyle(
              color: MyColors().deepBlue,
              fontWeight: FontWeight.w900,
              fontSize: 14))
    ],
  );
}

Widget detailItem(String property, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          property,
          style: TextStyle(fontSize: 12, color: MyColors().textBlack),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
        ),
        Text(
          value,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: MyColors().textBlack),
        )
      ],
    ),
  );
}


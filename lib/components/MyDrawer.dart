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
    List<IconData> navIcons = [
      Icons.account_circle,
      Icons.calendar_today,
      Icons.payment,
      Icons.message
    ];
    List<String> navTitles = [
      "Profile",
      "Bookings",
      "Payments",
      "Conversation"
    ];

    return Container(
      padding: EdgeInsets.all(10),
      width: size.width * 0.8,
      color: colors.deepBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/runningMan.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Zhenya Rynzhuk",
                      style: TextStyle(
                          color: colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ),

          /////////////////////////////////////////////////////////
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: navIcons.length,
                        itemBuilder: (context, index) {
                          return _navItem(navIcons[index], navTitles[index]);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _navItem(Icons.exit_to_app, "Logout"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          "Version- 1.0.1",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _navItem(IconData icon, String title) {
  return ListTile(
    leading: Icon(
      icon,
      color: MyColors().white,
    ),
    title: Text(
      title,
      style: TextStyle(color: MyColors().white, fontSize: 14),
    ),
  );
}

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
          Padding(
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
          Padding(
            padding: const EdgeInsets.only(left: 20),
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
          _navItem(Icons.exit_to_app, "Logout")
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
      style: TextStyle(color: MyColors().white),
    ),
  );
}

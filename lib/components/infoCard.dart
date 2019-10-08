import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

class InfoCard extends StatelessWidget {
  InfoCard({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var colors = MyColors();
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                color: colors.gray,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
            width: size.width * 0.75,
            child: Text("User info",
                style: TextStyle(color: colors.deepBlue, fontSize: 13)),
          ),
        ),
        Transform.translate(
          offset: Offset(0, 35),
          child: Container(
            decoration: BoxDecoration(
                color: colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            width: size.width,
            child: Column(
              children: <Widget>[
                _cardListItem(
                    leading: Icon(
                      Icons.location_on,
                      color: colors.deepBlue,
                      size: 29,
                    ),
                    title: "California",
                    subtitle: '548 Market St, San Francisco, CA 94104'),
                Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: colors.deepBlue,
                        size: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("24/08/2019"),
                      ),
                    ],
                  ),
                ),
                Divider(),
                otherInfo("Session type", "Body Sculpting"),
                otherInfo("Speciality", "Cardio"),
                Container(
                  decoration: BoxDecoration(
                      color: colors.gray,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: RichText(
                    text: TextSpan(
                        text: "Session Cost :",
                        style: TextStyle(fontSize: 15, color: colors.textBlack),
                        children: [
                          TextSpan(
                              text: "\$45",
                              style: TextStyle(
                                  color: colors.deepBlue,
                                  fontWeight: FontWeight.w900))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget _cardListItem(
    {Widget leading, String title = "", String subtitle = ""}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          leading,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  title,
                  style: TextStyle(
                      color: MyColors().textBlack,
                      fontSize: 17,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Text(
                subtitle,
                maxLines: 3,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(color: MyColors().textBlack, fontSize: 13),
              )
            ],
          ),
        ],
      ));
}

Widget otherInfo(title, content) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 61),
    padding: EdgeInsets.symmetric(vertical: 3),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: TextStyle(fontSize: 12, color: MyColors().textBlack)),
        Text(content,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: MyColors().textBlack))
      ],
    ),
  );
}

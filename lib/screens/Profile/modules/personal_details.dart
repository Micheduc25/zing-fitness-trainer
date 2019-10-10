import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';

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
                detailItem("Trainer name", "Nathan Riley"),
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

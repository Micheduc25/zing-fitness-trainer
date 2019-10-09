import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/personal_details.dart';

class TrainerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //the gray container containing physical properties and their values
            Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 0),
                decoration: BoxDecoration(
                    color: MyColors().gray,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Image.asset("assets/images/certification.png"),
                  title: Text("Certificates"),
                  trailing: Icon(
                    Icons.navigate_next,
                    size: 40,
                    color: MyColors().deepBlue,
                  ),
                )),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                detailItem("Service area", "Outdoor"),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Experience", "6 Years"),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Session rate", "\$10 per hour"),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Session type", "Body Sculpting"),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Speciality", "Cardio"),
              ],
            )
          ]),
        ));
  }
}

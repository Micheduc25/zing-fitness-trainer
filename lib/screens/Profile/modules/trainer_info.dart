import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/providers/profile_provider.dart';
import 'package:zing_fitnes_trainer/screens/Profile/certificate_screen.dart';
import 'package:zing_fitnes_trainer/screens/Profile/trainer_profile_model.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/personal_details.dart';

class TrainerInfo extends StatelessWidget {
  TrainerInfo(this.userId, this.profileModel);
  final String userId;
  final TrainerProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //the gray container containing physical properties and their values
            Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 0),
                decoration: BoxDecoration(
                    color: MyColors().gray,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return StreamProvider.value(
                            value: ProfileProvider.instance()
                                .streamUserCerts(userId),
                            catchError: (context, error) {
                              print(error);
                            },
                            child: CertificateScreen(userId));
                        //  child: ProfileRegularUser();
                      }),
                    );
                  },
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
                detailItem("Service area", profileModel.serviceArea),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Experience", profileModel.experience),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Session rate", profileModel.sessionRate),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Session type", "Body Sculpting"),
                Divider(
                  color: MyColors().gray,
                ),
                detailItem("Speciality", profileModel.speciality),
              ],
            )
          ]),
        ));
  }
}

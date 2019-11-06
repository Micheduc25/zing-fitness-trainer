import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/personal_details.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/trainer_info.dart';
import 'package:zing_fitnes_trainer/screens/Profile/trainer_profile_model.dart';

class TabBarViews extends StatelessWidget {
  TabBarViews({this.profileModel, this.userId});
  final String userId;
  final TrainerProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // constraints: BoxConstraints(minHeight: size.height * 0.4),
      height: size.height * 0.4,
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          PersonalDetails(userId, profileModel),
          TrainerInfo(userId, profileModel)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/personal_details.dart';
import 'package:zing_fitnes_trainer/screens/Profile/modules/trainer_info.dart';

class MyViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[PersonalDetails(), TrainerInfo()],
    );
  }
}

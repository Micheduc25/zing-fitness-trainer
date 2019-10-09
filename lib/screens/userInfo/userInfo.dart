import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/InfoCard.dart';
import 'package:zing_fitnes_trainer/components/InfoPages.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoPages(
      title: "User Info",
      paramTitle1: "Height",
      paramValue1: "170 CM",
      paramTitle2: "Weight",
      paramValue2: "96 KG",
      card: InfoCard(),
    );
  }
}

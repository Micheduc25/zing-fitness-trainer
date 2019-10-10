import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Conversations/conversation.dart';
import 'package:zing_fitnes_trainer/screens/Email_Verification/email_verification.dart';
import 'package:zing_fitnes_trainer/screens/Payments/payments.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profile.dart';
import 'package:zing_fitnes_trainer/screens/Trainer_Info_add/trainerInfoAdd.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return Payments();
  }
}

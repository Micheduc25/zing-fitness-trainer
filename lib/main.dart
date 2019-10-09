import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Email_Verification/email_verification.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signUp.dart';
import 'package:zing_fitnes_trainer/screens/Trainer_Info_add/trainerInfoAdd.dart';
import 'package:zing_fitnes_trainer/screens/bookingsDetail/bookingsDetails.dart';
import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';
import 'package:zing_fitnes_trainer/screens/userInfo/userInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return Login_SignUP();
  }
}

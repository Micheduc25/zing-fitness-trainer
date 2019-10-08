import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/InfoCard.dart';
import 'package:zing_fitnes_trainer/components/InfoPages.dart';
import 'package:zing_fitnes_trainer/screens/Email_Verification/email_verification.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signUp.dart';
import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';
import 'package:zing_fitnes_trainer/screens/userInfo/userInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserInfo();
  }
}

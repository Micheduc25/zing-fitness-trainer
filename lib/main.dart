import 'package:flutter/material.dart';


import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signUp.dart';

import 'package:zing_fitnes_trainer/screens/Conversations/conversation.dart';
import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';


import 'package:zing_fitnes_trainer/screens/Profile/profile.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget build(BuildContext context) {

   // return BookingsPage();

    return ProfilePage();

  }
}

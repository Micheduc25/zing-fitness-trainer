import 'package:flutter/material.dart';
<<<<<<< HEAD
import './screens/Email_Verification/email_verification.dart';

// import 'package:zing_fitnes_trainer/screens/bookings/bookings.dart';
import './screens/Login_SignUp/login_signUp.dart';
import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';
=======
import 'package:zing_fitnes_trainer/screens/bookingsDetail/bookingsDetail.dart';
>>>>>>> 874edd91bbf89dfb82ca5d53b874d83b0909482e

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return EmailVerification();
=======
    return InfoPages(
      title: "Bookings Details",
      paramTitle1: "Start time",
      paramValue1: "05:00 PM",
      paramTitle2: "End time",
      paramValue2: "07:00 PM",
    );
>>>>>>> 874edd91bbf89dfb82ca5d53b874d83b0909482e
  }
}

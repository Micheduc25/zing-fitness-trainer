import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Conversations/conversation.dart';
import 'package:zing_fitnes_trainer/screens/Email_Verification/email_verification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EmailVerification();
  }
}

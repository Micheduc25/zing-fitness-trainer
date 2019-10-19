import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';





import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signup_regular.dart';

import 'package:zing_fitnes_trainer/screens/Conversations/conversation.dart';
import 'package:zing_fitnes_trainer/screens/Profile/EditProfileRegular.dart';
import 'package:zing_fitnes_trainer/screens/Profile/editTrainerProfile.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profileRegular.dart';
import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';


import 'package:zing_fitnes_trainer/screens/Profile/profile.dart';


import 'package:zing_fitnes_trainer/screens/Conversations/conversation.dart';

import 'package:zing_fitnes_trainer/screens/Email_Verification/email_verification.dart';
import 'package:zing_fitnes_trainer/screens/Payments/payments.dart';
import 'package:zing_fitnes_trainer/screens/Profile/profile.dart';
import 'package:zing_fitnes_trainer/screens/Trainer_Info_add/trainerInfoAdd.dart';

import 'package:zing_fitnes_trainer/screens/chat_page/chat_page.dart';




import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signup_regular.dart';
import 'package:zing_fitnes_trainer/screens/Trainer_Info_add/trainerInfoAdd.dart';
import 'package:zing_fitnes_trainer/screens/selectusertype/select_user_type_screen.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_inherited_widget.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_settings.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  final settings = AppSettings(preferences);
  //runApp(App(settings));
  runApp( EditTrainerProfile());
}

class App extends StatelessWidget {
  App(this.settings);
  final AppSettings settings;
  @override
  Widget build(BuildContext context) {
    return AppInheritedWidget(
      settings: settings,
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SelectUserTypeScreen(),

          theme: ThemeData(
              fontFamily: "FredokaOne-Regular",

              primaryColor: Color(0xff01b6ff),
              primaryColorDark: Color(0xff2f00ad)
          ),

        )

    );
  }
}


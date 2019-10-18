import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signup_regular.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_signup_trainer.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_settings.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_settings_inherited.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppSettings settings = AppSettingsInherited.of(context).settings;
    return PreferenceBuilder<String>(

        preference:settings.userType,

        builder: (context, String userType){
          if(userType == Config.regularUser)
            {
              return LoginSignUpRegular();
            }else
              {
                return LoginSignUpTrainer();
              }


    });
  }
}

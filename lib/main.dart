import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:zing_fitnes_trainer/components/Profile.dart';
import 'package:zing_fitnes_trainer/screens/selectusertype/select_user_type_screen.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_inherited_widget.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  final settings = AppSettings(preferences);
  //runApp(App(settings));
  runApp(App(settings));
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
              primaryColorDark: Color(0xff2f00ad)),
        ));
  }
}

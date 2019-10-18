
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/shared_preferences/app_settings.dart';


class AppSettingsInherited extends InheritedWidget {
  const AppSettingsInherited({
    Key key,
    @required Widget child,
    this.settings
  })
      : assert(child != null),
        super(key: key, child: child);
  final AppSettings settings;

  static AppSettingsInherited of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppSettingsInherited) as AppSettingsInherited;
  }

  @override
  bool updateShouldNotify(AppSettingsInherited old) {
    return true;
  }
}
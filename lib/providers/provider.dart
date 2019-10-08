import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarData extends ChangeNotifier {
  String appBarTitle = "Active Session";

  set setTitle(String value) {
    this.appBarTitle = value;
    notifyListeners();
  }

  get getTitle => this.appBarTitle;
}

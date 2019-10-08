import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/bookingsDetail/bookingsDetail.dart';

import 'package:zing_fitnes_trainer/screens/bookings_active/bookings_active.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InfoPages(
      title: "Bookings Details",
      paramTitle1: "Start time",
      paramValue1: "05:00 PM",
      paramTitle2: "End time",
      paramValue2: "07:00 PM",
    );
  }
}

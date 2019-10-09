import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/InfoPages.dart';
import 'package:zing_fitnes_trainer/components/bookingCard.dart';

class BookingsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoPages(
      title: "Bookings Details",
      paramTitle1: "Start time",
      paramValue1: "05:00 PM",
      paramTitle2: "End time",
      paramValue2: "07:00 PM",
      card: BookingsCard(),
    );
  }
}

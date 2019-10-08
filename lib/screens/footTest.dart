import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/components/footBg.dart';

class TestPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hello",
        home: Scaffold(
          body: Container(alignment: Alignment.bottomCenter, child: FootBg()),
        ));
  }
}

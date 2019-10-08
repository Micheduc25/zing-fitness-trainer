import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(title: "SplashScreen", home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.only(bottom: 0),
        constraints: BoxConstraints.expand(
            width: double.infinity, height: double.infinity),
        decoration: BoxDecoration(color: Color(0xFF01B6FF)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: size.height * 0.22),
                  child: SizedBox(
                      width: double.infinity,
                      height: size.height * 0.17,
                      child: Image.asset("assets/images/logo.png"))),
              SizedBox(
                  width: double.infinity,
                  height: size.height * 0.36,
                  child: Image.asset("assets/images/mng.png"))
            ]));
  }
}

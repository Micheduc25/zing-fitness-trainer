import 'package:flutter/material.dart';

class Login_SignUP extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyLoginSignUp(),
    );
  }
}

class MyLoginSignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Color(0xff01b6ff),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[

              ],
            ),


            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(name)
              ],
            )
          ],
        )
      ),
    );
  }
}
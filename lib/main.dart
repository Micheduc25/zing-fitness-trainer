import 'package:flutter/material.dart';
import './components/input.dart';
import './components/button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        appBar: AppBar(),
        body:Column(
          children: <Widget>[
            Center(child:  Input_field(icon: Icons.email, hintText: 'hello we are here',),),
            Button(text: 'Next',)
      
          ],
        )
    ));
  }
}

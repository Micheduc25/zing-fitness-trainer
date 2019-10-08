import 'package:flutter/material.dart';
import '../../components/footBg.dart';
import '../../utils/myColors.dart';

class Login_SignUP extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyLoginSignUp(),
    );
  }
}

class MyLoginSignUp extends StatelessWidget{
   final col=MyColors();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: col.skyBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color:Colors.red,

              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width/15, 
                MediaQuery.of(context).size.height/13, 
                MediaQuery.of(context).size.width/15,
                0),

                child:Row(
                  children: <Widget>[

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('./assets/images/logo.png', 
                            height: MediaQuery.of(context).size.height/8,
                            width: MediaQuery.of(context).size.width/2.1
                          ),


                        ],
                      ) ,
                    )
                  ],
                )
            ),


            FootBg(),
          ],
        )
      ),
    );
  }
}
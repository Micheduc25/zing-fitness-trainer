import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/login_SignUpProvider.dart';
import '../../components/footBg.dart';
import '../../utils/myColors.dart';
import './modules/Login.dart';
import './modules/SignUp.dart';

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
              // height: MediaQuery.of(context).size.height/1.3,
              //color:Colors.red,

              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width/15, 
                MediaQuery.of(context).size.height/15, 
                MediaQuery.of(context).size.width/15,
                0),

                child:Row(
                  children: <Widget>[

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('./assets/images/logo.png', 
                            height: MediaQuery.of(context).size.height/9.4,
                            width: MediaQuery.of(context).size.width/2.2
                          ),

                          //this is the area where we are going to do out conditional rendering
                          MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                builder: (_)=>Login_SignUp_Provider(),
                              ),

                            ],

                            child: Consumer<Login_SignUp_Provider>(
                            builder: (context, data, child)=>data.showCode
                          ),
                          )
                          
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import '../../../utils/myColors.dart';
import '../../../providers/login_SignUpProvider.dart';
import './SignUp.dart';


class Login extends StatelessWidget{
  final color=MyColors();
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //
        //this row contains two flatbuttons and a text widget
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

             ButtonTheme(
              minWidth: 5,
              child: 
                FlatButton(
                  padding: EdgeInsets.all(0),

                  child: Text('Login',

                    style:TextStyle(color: color.deepBlue, 
                      decoration: TextDecoration.underline,
                      fontSize: 22,
                      fontWeight: FontWeight.w500
                    ) 
                  ),

                ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width/15,
                0 , 
                MediaQuery.of(context).size.width/15, 
                0),

              child:Text(
                'or',
                style:TextStyle(color: color.white)) ,
            ),

//here we are using provider to switch to Signup upon clicking signUp
            Consumer<LoginSignUpProvider>(
              builder: (context, data,child)=>
              
              ButtonTheme(
                minWidth: 5,
                child: 
                  FlatButton(
                    padding: EdgeInsets.all(0),

                    child: Text('Sign Up',

                      style:TextStyle(color: color.deepBlue, 
                        fontSize: 22
                      ) 
                    ),

                    onPressed: (){data.changeCode=SignUp();},
                  ),
              )
            )
            
          ],
        ),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //
            //this is the first child of the inner column and it holds the white texts
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0, 
                    MediaQuery.of(context).size.height/90, 
                    0, 
                    MediaQuery.of(context).size.height/120),
                    child: Text("Make",
                      style: TextStyle(color: color.white, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                ),

                Text("Your self fit",
                 style: TextStyle(color: color.white, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(8),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Input_field(icon: Icons.email, hintText: 'Email id',),

                Padding(
                  padding: EdgeInsets.all(7),
                ),

                Input_field(icon: Icons.lock_outline, hintText: 'Password',)
              ],
            ),
              
              Padding(
              padding: EdgeInsets.all(3),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Forgot Password?', 
                    style: TextStyle(color: color.white),)
                )
              ],
            ),
            
            Padding(
              padding: EdgeInsets.all(3),
            ),

            Button(text: 'LOGIN',),


            //
            //this is the second child of the inner column and it contains two inputfields
            //
          ],
        )
      ],
    );
  }
}
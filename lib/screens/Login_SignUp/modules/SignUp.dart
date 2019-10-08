import 'package:flutter/material.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import '../../../utils/myColors.dart';


class SignUp extends StatelessWidget{
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


            ButtonTheme(
              minWidth: 5,
              child: 
                FlatButton(
                  padding: EdgeInsets.all(0),

                  child: Text('Sign Up',

                    style:TextStyle(color: color.deepBlue, 
                      fontSize: 22,
                      decoration: TextDecoration.underline,
                    ) 
                  ),
                ),
            )
            
          ],
        ),

        Padding(padding: EdgeInsets.all(10),),
  

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Input_field(icon: Icons.email, hintText: 'Trainer name',),

              Padding(padding: EdgeInsets.all(7),),

              Input_field(icon: Icons.lock_outline, hintText: 'Email id',),

              Padding(padding: EdgeInsets.all(7),),

              Input_field(icon: Icons.lock_outline, hintText: 'Mobile number',),

              Padding(padding: EdgeInsets.all(7),),

              Input_field(icon: Icons.lock_outline, hintText: 'Password',)
            ],
          ),
            
          Padding(padding: EdgeInsets.all(10),),
      
          Button(text: 'NEXT',),

      ],
    );
  }
}
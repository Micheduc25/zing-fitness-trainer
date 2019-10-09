import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/login_SignUpProvider.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import './Login.dart';

class SignUp extends StatelessWidget {
  final color = MyColors();
  @override
  Widget build(BuildContext context) {
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
                child: Consumer<Login_SignUp_Provider>(
                  builder: (context, data, child) => FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Text('Login',
                        style: TextStyle(
                            color: color.deepBlue,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),

                    onPressed: () {
                      data.changeCode =Column(
                        children: <Widget>[
                           Login(),
                           Padding(
                             padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/40),
                           )
                        ],
                      );
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 15,
                  0,
                  MediaQuery.of(context).size.width / 15,
                  0),
              child: Text('or', style: TextStyle(color: color.white)),
            ),
            ButtonTheme(
              minWidth: 5,
              child: FlatButton(
                padding: EdgeInsets.all(0),
                child: Text('Sign Up',
                    style: TextStyle(
                      color: color.deepBlue,
                      fontSize: 22,
                      decoration: TextDecoration.underline,
                    )),
              ),
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.all(10),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Input_field(
              icon: Icons.perm_identity,
              hintText: 'Trainer name',
            ),
            Padding(
              padding: EdgeInsets.all(7),
            ),
            Input_field(
              icon: Icons.lock_outline,
              hintText: 'Email id',
            ),
            Padding(
              padding: EdgeInsets.all(7),
            ),
            Input_field(
              icon: Icons.phone_iphone,
              hintText: 'Mobile number',
            ),
            Padding(
              padding: EdgeInsets.all(7),
            ),
            Input_field(
              icon: Icons.lock_outline,
              hintText: 'Password',
            )
          ],
        ),

        Padding(
          padding: EdgeInsets.all(10),
        ),

        Button(
          text: 'NEXT',
        ),
      ],
    );
  }
}

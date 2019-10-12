import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import '../../../utils/myColors.dart';
import '../../../providers/login_SignUpProvider.dart';
import './SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final color = MyColors();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      key: _formKey,
      child: Column(
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
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Text('Login',
                      style: TextStyle(
                          color: color.deepBlue,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width / 15,
                    0,
                    MediaQuery.of(context).size.width / 15,
                    0),
                child: Text('or', style: TextStyle(color: color.white)),
              ),

//here we are using provider to switch to Signup upon clicking signUp
              Consumer<LoginSignUpProvider>(
                  builder: (context, data, child) => ButtonTheme(
                        minWidth: 5,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: color.deepBlue, fontSize: 22)),
                          onPressed: () {
                            data.changeCode = Column(
                              children: <Widget>[
                                SignUp(),
                                Padding(padding: EdgeInsets.all(2)
                                    // padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/500),
                                    )
                              ],
                            );
                          },
                        ),
                      ))
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
                        MediaQuery.of(context).size.height / 90,
                        0,
                        MediaQuery.of(context).size.height / 150),
                    child: Text(
                      "Make",
                      style: TextStyle(
                          color: color.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Your self fit",
                    style: TextStyle(
                        color: color.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(8),
              ),

              Consumer<LoginSignUpProvider>(
                builder: (context, mydata, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Input_field(
                      onChanged: (value) {
                        mydata.setEmail = value;
                      },
                      validatorError: 'no provoke me, enter your email',
                      icon: Icons.email,
                      hintText: 'Email id',
                    ),
                    Padding(
                      padding: EdgeInsets.all(7),
                    ),
                    Input_field(
                      onChanged: (value) {
                        mydata.setpasssword = value;
                      },
                      icon: Icons.lock_outline,
                      hintText: 'Password',
                    )
                  ],
                ),
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
                    style: TextStyle(color: color.white),
                  ))
                ],
              ),

              Padding(
                padding: EdgeInsets.all(3),
              ),

              Consumer<LoginSignUpProvider>(
                builder: (context, data, child) => Button(
                    text: 'LOGIN',
                    onClick: () {
                      validateForm(data);
                    }),
              )
              //
              //this is the second child of the inner column and it contains two inputfields
              //
            ],
          )
        ],
      ),
    );
  }

  validateForm(LoginSignUpProvider data) {
    if (_formKey.currentState.validate()) {
      print("success");
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: MyColors().skyBlue,
                title: Text(
                  'Login Info',
                  style: TextStyle(color: MyColors().white),
                ),
                content: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Email : ",
                            style: TextStyle(color: MyColors().white),
                          ),
                          Text(
                            data.readEmail,
                            style: TextStyle(color: MyColors().white),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Password : ",
                            style: TextStyle(color: MyColors().white),
                          ),
                          Text(
                            data.readloginPass,
                            style: TextStyle(color: MyColors().white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "close",
                      style: TextStyle(color: MyColors().white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }
}

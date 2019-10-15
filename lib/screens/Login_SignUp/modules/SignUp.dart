import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zing_fitnes_trainer/components/passwordInput.dart';
import 'package:zing_fitnes_trainer/utils/showdialogue.dart';
import 'package:zing_fitnes_trainer/utils/validator.dart';
import '../../../providers/login_SignUpProvider.dart';
import '../../../components/button.dart';
import '../../../components/input.dart';
import 'package:zing_fitnes_trainer/utils/myColors.dart';
import './Login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final color = MyColors();

  @override
  Widget build(BuildContext context) {
    var formdata = Provider.of<LoginSignUpProvider>(context);
    return Form(
      autovalidate: formdata.readAutovalidate,
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
                  child: Consumer<LoginSignUpProvider>(
                    builder: (context, data, child) => FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text('Login',
                          style: TextStyle(
                              color: color.deepBlue,
                              fontSize: 22,
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        data.changeCode = Column(
                          children: <Widget>[
                            Login(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height / 40),
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
                  onPressed: () {},
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
/////////
          Consumer<LoginSignUpProvider>(
            builder: (context, data, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Input_field(
                    icon: Icons.perm_identity,
                    hintText: 'Trainer name',
                    validator: (value) {
                      return Validator().textValidator(value);
                    },
                    onChanged: (value) {
                      data.setTrainerName = value;
                    },
                    hide: false),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                Input_field(
                    icon: Icons.lock_outline,
                    hintText: 'Email id',
                    validator: (value) {
                      return Validator().emailValidator(value);
                    },
                    onChanged: (value) {
                      data.setsignUpEmail = value;
                    },
                    hide: false),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                Input_field(
                    icon: Icons.phone_iphone,
                    hintText: 'Mobile number',
                    validator: (value) {
                      return Validator().textValidator(value);
                    },
                    onChanged: (value) {
                      data.setsignUpNumber = value;
                    },
                    hide: false),
                Padding(
                  padding: EdgeInsets.all(7),
                ),
                PasswordInputfield(
                    icon: Icons.lock_outline,
                    hintText: 'Password',
                    validator: (value) {
                      return Validator().passwordValidator(value);
                    },
                    onChanged: (value) {
                      data.setsignUppasssword = value;
                    },
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),

          Consumer<LoginSignUpProvider>(
            builder: (context, data, _) => Button(
                text: 'NEXT',
                onClick: () {
                  validateForm(data);
                }),
          ),
        ],
      ),
    );
  }

  validateForm(LoginSignUpProvider data) {
    if (_formKey.currentState.validate()) {
      showDialog(
          context: context,
          builder: (context) => InfoDialogue(
                title: "SignUp Info",
                values: {
                  "Trainer Name": data.readTrainerName,
                  "Email Id": data.readsignUpEmail,
                  "Mobile Number": data.readSignUpNumber,
                  "Password": data.readSignUpPassword
                },
              ));
    } else {
      data.setAutovalidate = true;
    }
  }
}

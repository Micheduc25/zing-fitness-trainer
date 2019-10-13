import 'package:flutter/widgets.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/modules/Login.dart';

class LoginSignUpProvider with ChangeNotifier {
  Widget _code = Temp();

  set changeCode(value) {
    _code = value;
    notifyListeners();
  }

  get showCode => _code;

  String _loginEmail;
  set setEmail(value) {
    _loginEmail = value;
    notifyListeners();
  }

  get readEmail => _loginEmail;

  String _loginPass;
  set setpasssword(value) {
    _loginPass = value;
    notifyListeners();
  }

  get readloginPass => _loginPass;

  //these are the variables for the signup section
//
  String _signupTrainerName;
  set setTrainerName(value) {
    _signupTrainerName = value;
    notifyListeners();
  }

  get readTrainerName => _signupTrainerName;

  String _signUpEmail;
  set setsignUpEmail(value) {
    _signUpEmail = value;
    notifyListeners();
  }

  get readsignUpEmail => _signUpEmail;

  String _signUpPass;

  set setsignUppasssword(value) {
    _signUpPass = value;
    notifyListeners();
  }

  get readSignUpPassword => _signUpPass;

  String _signUpNumber;

  set setsignUpNumber(value) {
    _signUpNumber = value;
    notifyListeners();
  }

  get readSignUpNumber => _signUpNumber;

  //here we control autovalidation

  bool autovalidate = false;

  set setAutovalidate(bool value) {
    autovalidate = value;
  }

  get readAutovalidate => autovalidate;
}

//the class temp below holds is the default content of the provider varaible _code
//the main reason for creating the class is so that we can use the media query to get the screen height
//we can't just use it directly because it must be inside a context
class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Login(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 30),
        )
      ],
    );
  }
}

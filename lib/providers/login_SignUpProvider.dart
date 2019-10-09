import 'package:flutter/widgets.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/modules/Login.dart';

class LoginSignUpProvider with ChangeNotifier {
  Widget _code = Login();

  set changeCode(value) {
    _code = value;
    notifyListeners();
  }

  get showCode => _code;
}

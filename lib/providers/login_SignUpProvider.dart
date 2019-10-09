import 'package:flutter/widgets.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/modules/Login.dart';

class Login_SignUp_Provider with ChangeNotifier {
  Widget _code = Temp();

  set changeCode(value) {
    _code = value;
    notifyListeners();
  }

  get showCode => _code;
}



//the class temp below holds is the default content of the provider varaible _code
//the main reason for creating the class is so that we can use the media query to get the screen height
//we can't just use it directly because it must be inside a context
class Temp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
          Login(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/27),
          )
      ],
    );
  }
}
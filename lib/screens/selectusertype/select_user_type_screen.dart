import 'package:flutter/material.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/login_page.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';
import '../../components/footBg.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SelectUserTypeScreen extends StatefulWidget {
  @override
  _SelectUserTypeScreenState createState() => _SelectUserTypeScreenState();
}

class _SelectUserTypeScreenState extends State<SelectUserTypeScreen> {

  _saveUserType(String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("saved userId to preferences");
    prefs.setString(Config.userType, userType);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(

       alignment: Alignment.bottomCenter,
        children: <Widget>[

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(

                  width: size.width/1.3,

                  height: size.height/12,
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed: (){

                    _saveUserType(Config.regularUser);
                  },
                  child: Text("Regular User",style: TextStyle(fontSize: 20,color: Colors.white),),),
                ),

                Container(
                  height: size.height/12,
                  width: size.width/1.3,
                 margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onPressed: (){
                      _saveUserType(Config.trainer);
                  },
                    child: Text("Trainer",style: TextStyle(fontSize: 20),),),
                ),
              ],
            ),


          FootBg()
        ],
      )
    );

  }
}




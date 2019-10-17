import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:zing_fitnes_trainer/screens/Login_SignUp/modules/Login.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';





class LoginSignUpProvider with ChangeNotifier {

  Firestore _firestore;
  //FirebaseStorage storage;

  FirebaseAuth firebaseAuth;


  LoginSignUpProvider.instance():
      _firestore = Firestore.instance,
      firebaseAuth = FirebaseAuth.instance;



  Future<void> saveUserData(String phoneNumber,String fullNames){
    Future<FirebaseUser> user = firebaseAuth.currentUser();
    return user.then((FirebaseUser firebaseUser){

      print("user id is dollar " +firebaseUser.uid );

      var map =  Map<String, dynamic>();
      map[Config.userId] = firebaseUser.uid;
      map[Config.email] = firebaseUser.email;
      map[Config.phone] = phoneNumber;
      map[Config.fullNames] = fullNames;



      map[Config.admin] = false;



     // map[Config.notificationToken] = fcmToken;
      map[Config.createdOn] = FieldValue.serverTimestamp();
      _firestore.collection(Config.users)
          .document(firebaseUser.uid)
          .setData(map,merge: true)

          .then((_) {


        //save uid
       // print(value.toString());
     //   _saveUid(firebaseUser.uid);
        print("User Successfully registered");

      });


    });
  }






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


  //here we manage the keyboard types for form inputs

  
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

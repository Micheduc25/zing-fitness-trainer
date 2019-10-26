import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zing_fitnes_trainer/utils/Config.dart';

final auth = FirebaseAuth.instance;

class UserData {
  String displayName;
  String email;
  String uid;
  String password;

  UserData({this.displayName, this.email, this.uid, this.password});
}

class UserAuth {
  String statusMsg = "Account Created Successfully";

  //To create new User
  Future<String> createUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return statusMsg;
  }

  Future<bool> resetUserPassword(String email) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  //To verify new User
  Future<String> verifyUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return Config.loginMsg;
  }

  Future<String> forgotPassword(String email) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return "Email Sent";
  }

  Future<Null> getUser() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    Future<FirebaseUser> user = firebaseAuth.currentUser();
    user.then((FirebaseUser firebaseUser) {
      firebaseUser.uid;
    });
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

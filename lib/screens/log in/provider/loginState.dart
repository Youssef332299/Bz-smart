import 'package:flutter/cupertino.dart';

class LoginState {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isCheck = false;
  bool isLookingLeft = false;
  bool isLookingRight = false;


  String? username;
  String? password;
  bool? emailcheck;
  bool? usernamecheck;
  bool? passwordcheck;
  bool? color;
  bool isHidden = true;

}
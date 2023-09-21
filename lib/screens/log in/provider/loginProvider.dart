import 'package:bzsmart/screens/log%20in/provider/loginState.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginProvider extends ChangeNotifier {
  LoginState state = LoginState();

  void initState() {
    checkRememberMe();
  }

  void validateEmailAndPassword(context) {
    if (state.emailController.text.isNotEmpty ||
        state.passwordController.text.isNotEmpty) {
      if (state.isCheck) {
        setRememberMe(
            state.emailController.text, state.passwordController.text);
      }
      // await Future.delayed(const Duration(seconds: 1));
      Navigator.of(context)
          .pushNamedAndRemoveUntil("navigation", (route) => false);
    }
    notifyListeners();
  }

  void isHidden() {
    state.isHidden = !state.isHidden;
    notifyListeners();
  }

  checkRememberMe() async {
    SharedPreferences.getInstance().then((prefs) {
      bool rememberMe = prefs.getBool('remember_me')!;
      state.isCheck = rememberMe;
      if (state.isCheck) {
        // SharedPreferences.getInstance().then((prefs) {
        state.emailController.text = prefs.getString('emailValue') ?? "";
        state.passwordController.text = prefs.getString('passwordValue') ?? "";
        notifyListeners();
      }
    });
  }

  void saveIsCheck(bool newBool) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', newBool);
    notifyListeners();
  }

  Future setRememberMe(email, password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString("emailValue", email);
    await sharedPreferences.setString("passwordValue", password);
    notifyListeners();
  }

  isCheck(newBool) {
    state.isCheck = newBool!;
    saveIsCheck(state.isCheck);
    setRememberMe(state.emailController.text, state.passwordController.text);
    notifyListeners();
  }

  bool isAr() {
    return Intl.getCurrentLocale() == "ar" ? true : false;
  }
}

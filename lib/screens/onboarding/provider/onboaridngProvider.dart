import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboaridngState.dart';

class OnboaridngProvider extends ChangeNotifier{

  OnboaridngState state = OnboaridngState();

  onTap(context) {
    if (state.pageIndex < 2) {
      state.scroll.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate);
    } else {
      setBool();
      Navigator.of(context)
          .pushNamedAndRemoveUntil("createAccount", (route) => false);
    }
  }

  changeIndex(index) {
    state.pageIndex = index;
    notifyListeners();
  }

  setBool() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setBool("newCostumer", true);
  }
}
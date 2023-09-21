import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'langState.dart';

class LangProvider extends ChangeNotifier {
  LangState state = LangState();

  void getLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    state.lang = sharedPreferences.get("lang").toString();
  }

  fillRadioList(context){
    int length = state.langList.length;
    for(int i = 0; i < length; i++){
      state.radio.add(false);
    }
  }

  Future onTapRadio(i, pdf) async {
    if(!state.radio[i]){
      int index;
      index = state.radio.indexWhere((element) => element == true);
      if (index != -1) {
        state.radio[index] = false;
      }
      state.radio[i] = true;
      state.langChocin = i;
      notifyListeners();
      return state.radio[i];
    }
  }

  void choseLang(i) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(i == 0){
      state.lang = "en";
      sharedPreferences.setString("lang", "en");
    }else{
      state.lang = "ar";
      sharedPreferences.setString("lang", "ar");
    }
  }
}

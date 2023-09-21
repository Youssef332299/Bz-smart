import 'package:bzsmart/core/routes/routes.dart';
import 'package:bzsmart/screens/splash/provider/splashState.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider extends ChangeNotifier {
  SplashState state = SplashState();

  Future newCostumer(context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool? newCostumer = sharedPreferences.getBool("newCostumer");

    // try { // to check internet
    // var result = await InternetAddress.lookup("google.com");
    // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) { // If Is Online
    if (newCostumer == true) {
      Navigator.of(context).pushNamed(Routes.login);
    } else {
      Navigator.of(context).pushNamed(Routes.lang);
    }
  }

  // } on SocketException catch (_) { // If user have no internet
  // ScaffoldMessenger.of(context)
  //     .showSnackBar(const SnackBar(content: Text("Check network")));    }
  // }

  Future<void> handleData(context) async {
    await Future.delayed(const Duration(seconds: 5));
    newCostumer(context);
  }
}

import 'package:bzsmart/screens/log%20in/provider/loginProvider.dart';
import 'package:bzsmart/screens/splash/provider/splashProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late FlutterGifController controller3;
  @override
  void initState() {
    context.read<SplashProvider>().handleData(context);
    context.read<LoginProvider>().initState();
    controller3 = FlutterGifController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),);
        controller3.animateTo(52, duration: const Duration(seconds: 4),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: GifImage(
            controller: controller3,
            image: const AssetImage("assets/images/boltmurg.gif"),
          ),
        ),
      ),
    );
  }
}

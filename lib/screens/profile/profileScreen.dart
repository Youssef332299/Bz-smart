import 'package:bzsmart/screens/lang/langScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/images/images.dart';
import '../../generated/l10n.dart';
import '../navigation/provider/navigationProvider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.black),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  ListTile(
                      splashColor: Colors.red,
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(Images.labA),
                      ),
                      title: Text(
                        "Youssef",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      hoverColor: Colors.red,
                      subtitle: const Text(
                        "youssefayman329@gmail.com",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "login", (route) => false);
                      Provider.of<NavigationProvider>(context,listen: false).state.currentIndex.value = 2;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.08,
                      height: MediaQuery.of(context).size.height / 25,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Colors.white),
                      alignment: Alignment.center,
                      child: Text(S.of(context).logout),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: LangScreen())
          ],
        ),
      ),

    );
  }
}

import 'package:bzsmart/core/colors/appColors.dart';
import 'package:bzsmart/core/shared/nextBtn.dart';
import 'package:bzsmart/screens/log%20in/provider/loginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../core/images/images.dart';
import '../../core/routes/routes.dart';
import '../../generated/l10n.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Image.asset(Images.logo),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(
          builder: (context, o, child) {
            // o is object
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      S.of(context).login,
                      style: const TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/ 7),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    autocorrect: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.information400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      labelText: S.of(context).email,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          color: Colors.black),
                      prefixIcon: const Icon(
                        Iconsax.sms_tracking,
                        color: Colors.black,
                      ),
                    ),
                    controller: o.state.emailController,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: true,
                    controller: o.state.passwordController,
                    obscureText: o.state.isHidden,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.information400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      labelText: S.of(context).password,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          color: Colors.black),
                      prefixIcon: const Icon(Iconsax.lock, color: Colors.black),
                      suffixIcon: InkWell(
                          onTap: () {
                            o.isHidden();
                          },
                          child: o.state.isHidden
                              ? const Icon(Iconsax.eye_slash, color: Colors.black)
                              : Icon(Iconsax.eye, color: HexColor("#2ACAEA"))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    CupertinoCheckbox(
                        value: context.watch<LoginProvider>().state.isCheck,
                        activeColor: Colors.black,
                        onChanged: (newBool) {
                          context.read<LoginProvider>().isCheck(newBool);
                        },
                        // checkColor: ,
                        side: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).dontHave,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black38)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.createAccount);
                      },
                      child: Text(
                        S.of(context).createAccount,
                        style: TextStyle(
                            fontSize: 14, color: AppColors.information500),
                      ),
                    ),
                  ],
                ),
                NextButton(
                  onPressed: () {
                    o.validateEmailAndPassword(context);
                  },
                  text: S.of(context).login,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

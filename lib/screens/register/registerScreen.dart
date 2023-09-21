import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../core/colors/appColors.dart';
import '../../core/images/images.dart';
import '../../core/routes/routes.dart';
import '../../core/shared/nextBtn.dart';
import '../../generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
        child: Column(
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
                  S.of(context).createAccount,
                  style: const TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.information400),
                  ),
                  labelText: S.of(context).username,
                  prefixIcon: const Icon(
                    Iconsax.profile_add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.information400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  labelText: S.of(context).email,
                  prefixIcon: const Icon(
                    Iconsax.sms_tracking,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: true,
                validator: (password) =>
                    password!.length < 8 ? S.of(context).passError : null,
                decoration: InputDecoration(
                  labelText: S.of(context).password,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.information400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w800,fontSize: 13,color: Colors.black),
                  // labelText: S.of(context),
                  prefixIcon: const Icon(Iconsax.lock, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            //Log In
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 20,
                // ),
                Text(S.of(context).alreadyHaveAccount,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.black38)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.login);
                  },
                  child: Text(
                    S.of(context).login,
                    style: TextStyle(fontSize: 14, color: AppColors.information400),
                  ),
                ),
              ],
            ),
            NextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.navigation);
              },
              text: S.of(context).createAccount,
            ),
          ],
        ),
      ),
    );
  }
}

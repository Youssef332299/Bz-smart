import 'package:bzsmart/screens/register/Provider/registerProvider.dart';
import 'package:bzsmart/screens/register/components/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../core/colors/appColors.dart';
import '../../../core/images/images.dart';
import '../../../generated/l10n.dart';


class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<RegisterProvider>(
            builder: (context, o, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: o.state.hasImage
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: FileImage(o.state.image),
                              radius: 70,
                              // backgroundColor: Colors.black,
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.black26,
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        o.getImage();
                                      },
                                      child: const Icon(
                                        Iconsax.camera,
                                        size: 50,
                                        color: Colors.white70,
                                      ))),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(Images.profile),
                              radius: 70,
                              // backgroundColor: Colors.black,
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.black26,
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        o.getImage();
                                      },
                                      child: const Icon(
                                        Iconsax.camera,
                                        size: 50,
                                        color: Colors.white70,
                                      ))),
                            ),
                    ),
                    TexField(
                      hint: S.of(context).phoneNumber,
                      icon: Icon(Iconsax.mobile5,color: AppColors.information300),
                    )
                  ],
                )));
  }
}

import 'package:bzsmart/screens/lang/Provider/langProvder.dart';
import 'package:bzsmart/screens/onboarding/provider/onboaridngProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/colors/appColors.dart';
import '../../core/images/images.dart';
import '../../core/shared/nextBtn.dart';
import '../../generated/l10n.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(Images.logo),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.7,
            width: double.infinity,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: context.watch<OnboaridngProvider>().state.scroll,
              onPageChanged: (int index) {
                context.read<OnboaridngProvider>().changeIndex(index);
              },
              children: context.watch<LangProvider>().state.lang == "en"
              ? context.watch<OnboaridngProvider>().state.boaridngWidgets
              : context.watch<OnboaridngProvider>().state.arabicBoaridngWidgets
            ),
          ),
          Container(
              height: 8,
              width: 40,
              alignment: Alignment.center,
              child: ListView.builder(
                  itemCount: context.watch<OnboaridngProvider>().state.boaridngWidgets.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Row(
                      children: [
                        Container(
                          width: context.watch<OnboaridngProvider>().state.pageIndex == index ? 8 : 6,
                          height: context.watch<OnboaridngProvider>().state.pageIndex == index ? 8 : 6,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                              color: context.watch<OnboaridngProvider>().state.pageIndex == index
                                  ? AppColors.primary700
                                  : AppColors.primary100,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ],
                    );
                  })), // dots
          NextButton(
            onPressed: () {
              context.read<OnboaridngProvider>().onTap(context);
            },
            text: context.watch<OnboaridngProvider>().state.pageIndex == 2
            ? S.of(context).start
            : S.of(context).next,
          ),
        ],
      ),
    );
  }
}

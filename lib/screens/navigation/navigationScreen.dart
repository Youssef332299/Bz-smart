import 'package:bzsmart/core/colors/appColors.dart';
import 'package:bzsmart/screens/navigation/components/onTap.dart';
import 'package:bzsmart/screens/navigation/provider/navigationProvider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.card_pos,
        ),
        activeIcon: OnTap(icon: Iconsax.card_pos5, text: S.of(context).visa),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.map_1,
        ),
        activeIcon: OnTap(icon: Iconsax.map5, text: S.of(context).map),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.home4,
        ),
        activeIcon: OnTap(icon: Iconsax.home_15, text: S.of(context).home),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.heart,
        ),
        activeIcon: OnTap(icon: Iconsax.heart5, text: S.of(context).favorites),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Iconsax.frame_1,
        ),
        activeIcon: OnTap(icon: Iconsax.frame5, text: S.of(context).profile),
        label: "",
      ),
    ];
    return Scaffold(
      body: SafeArea(
        top: false,
        child: PageView(
          controller: context.watch<NavigationProvider>().state.controller,
          physics: const AlwaysScrollableScrollPhysics(),
          onPageChanged: (index) {
            context.read<NavigationProvider>().pageChange(index);
          },
          children: context.watch<NavigationProvider>().state.pages,
        ),
      ),
      bottomNavigationBar:  ValueListenableBuilder(
            valueListenable:
                context.watch<NavigationProvider>().state.currentIndex,
            builder: (context, value, c) {
              return BottomNavigationBar(
                showSelectedLabels: true,
                elevation: 0,
                showUnselectedLabels: false,
                // type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.black,
                unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black),
                selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.black),
                currentIndex: context
                    .watch<NavigationProvider>()
                    .state
                    .currentIndex
                    .value,
                backgroundColor: AppColors.neutral200,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                onTap: (index) =>
                    context.read<NavigationProvider>().onBottomTapped(index),
                items: items,
              );
            }),
    );
  }
}

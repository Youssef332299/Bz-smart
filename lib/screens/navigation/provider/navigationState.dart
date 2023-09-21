import 'package:bzsmart/screens/Home/homeScreen.dart';
import 'package:bzsmart/screens/cart/cartScreen.dart';
import 'package:bzsmart/screens/favorites/favoritesScreen.dart';
import 'package:bzsmart/screens/map/mapScreen.dart';
import 'package:bzsmart/screens/profile/profileScreen.dart';
import 'package:flutter/cupertino.dart';

class NavigationState{

  final ValueNotifier<int> currentIndex = ValueNotifier(2);
  late final PageController controller;
  late final List<Widget> pages = [
    const CartScreen(),
    const MapScreen(),
    const HomeScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
    // const ProfileScreen(),
  ];
}
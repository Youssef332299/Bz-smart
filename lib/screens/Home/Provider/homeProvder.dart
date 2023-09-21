import 'dart:io';

import 'package:bzsmart/screens/Home/Provider/homeState.dart';
import 'package:bzsmart/screens/Home/widgets/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../data/model/products/productsModel.dart';

class HomeProvider extends ChangeNotifier {
  HomeState state = HomeState();

  void init() {
    addListToFill();
    loadBannerAd();
    loadInters();
  }


  void fillIconsList(List<bool> list, length) {
    for (int i = 0; i < length; i++) {
      list.add(false);
    }
    notifyListeners();
  }

  void addListToFill() {
    fillIconsList(state.iconAirpods, state.airpodsList.length);
    fillIconsList(state.iconLap, state.lapList.length);
    fillIconsList(state.iconPc, state.pcList.length);
    fillIconsList(state.iconPhone, state.phoneList.length);
    fillIconsList(state.iconTv, state.tvList.length);
    fillIconsList(state.iconWatch, state.watchList.length);
    fillIconsList(state.iconfavorite, state.displayList.length);
  }

  void onTopfavoriteSaveIcon(icon, i, ProductModel item, context) {
    if (icon[i]) {
      icon[i] = false;
      // saveIcon(i, false);
    } else {
      state.favorites.add(ProductModel(
          name: item.name,
          image: item.image,
          data: item.data,
          salary: item.salary));
      icon[i] = true;
      // saveIcon(i, true);
    }
    notifyListeners();
  }

  void homeSearch(String value) {
    state.displayList = HomeState.home
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void pcSearch(String value) {
    state.pcList = HomeState.pc
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void phoneSearch(String value) {
    state.phoneList = HomeState.phone
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void lapSearch(String value) {
    state.lapList = HomeState.lap
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void watchSearch(String value) {
    state.watchList = HomeState.watch
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void airpodsSearch(String value) {
    state.airpodsList = HomeState.airpods
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void tvSearch(String value) {
    state.tvList = HomeState.tv
        .where((element) => element.name!.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void removeFromFavorites(i) {
    state.favorites.removeAt(i);
    notifyListeners();
  }

  Route buildRoute(items) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          DetailsScreen(items: items),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        double begin = 0.0;
        double end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var anim = animation.drive(tween);
        return RotationTransition(
            turns: anim,
            child: ScaleTransition(
              scale: anim,
              child: child,
            ));
      },
    );
  }

  void loadBannerAd(){
    BannerAd(
        size: AdSize.banner,
        adUnitId: bannerAdmob(),
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            state.bannerAd = ad as BannerAd?;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        )).load();
    notifyListeners();
  }

  String bannerAdmob() {
    if (Platform.isAndroid)
    {
      if (state.isTest) {
        return "ca-app-pub-3940256099942544/6300978111";
      } else {
        return "ca-app-pub-1325447676364271/7326768825";
      }
    }
    else
    {
      if (state.isTest) {
        return "ca-app-pub-3940256099942544/2934735716";
      } else {
        return "ca-app-pub-1325447676364271/2800366307";
      }
    }
  }

  String interstitialAdmob() {
    if (Platform.isAndroid)
    {
      if (state.isTest) {
        return "ca-app-pub-3940256099942544/1033173712";
      } else {
        return "ca-app-pub-1325447676364271/1266162477";
      }
    }
    else
    {
      if (state.isTest) {
        return "ca-app-pub-3940256099942544/4411468910";
      } else {

        // return "ca-app-pub-1325447676364271/5844535887";
        return "ca-app-pub-1325447676364271/5844535887";
      }
    }
  }

  void loadInters(){
    InterstitialAd.load(
        adUnitId: interstitialAdmob(),
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              state.interstitialAd = ad;
            },
            onAdFailedToLoad: (ad){}
        ));
    notifyListeners();
  }

}

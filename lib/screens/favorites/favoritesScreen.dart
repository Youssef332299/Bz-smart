import 'package:bzsmart/screens/Home/Provider/homeProvder.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../core/colors/appColors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral200,
      body: Consumer<HomeProvider>(
        builder: (context, o, child) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              o.state.bannerAd != null
                  ? Container(
                      height: MediaQuery.of(context).size.height / 11,
                      width: double.infinity,
                      child: AdWidget(ad: o.state.bannerAd!),
                    )
                  : SizedBox(),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                      ),
                      reverse: false,
                      itemCount: o.state.favorites.length,
                      itemBuilder: (context, i) {
                        return Hero(
                          tag: o.state.favorites[i].salary.toString(),
                          child: InkWell(
                            onTap: () => {
                              Navigator.of(context)
                                  .push(o.buildRoute(o.state.favorites[i]))
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(bottom: 10, right: 10),
                              // height:
                              // MediaQuery.of(context).size.height / 2.6,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 6, offset: Offset(0, 2))
                                  ],
                                  // border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center.,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 100,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        o.removeFromFavorites(i);
                                      },
                                      icon: Icon(Iconsax.heart5,
                                          size: 22,
                                          shadows: const [
                                            BoxShadow(
                                                offset: Offset(0, 01),
                                                blurRadius: 2)
                                          ],
                                          color: AppColors.danger600),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topCenter,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              7,
                                      child: Image.asset(
                                          "${o.state.favorites[i].image}")),
                                ],
                              ),
                            ),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

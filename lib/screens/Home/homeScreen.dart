import 'package:bzsmart/screens/Home/components/inkwellCatigories.dart';
import 'package:bzsmart/screens/Home/widgets/aipodsWidge.dart';
import 'package:bzsmart/screens/Home/widgets/lapWidget.dart';
import 'package:bzsmart/screens/Home/widgets/pcWidget.dart';
import 'package:bzsmart/screens/Home/widgets/phoneWidge.dart';
import 'package:bzsmart/screens/Home/widgets/tvWidget.dart';
import 'package:bzsmart/screens/Home/widgets/watchWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../core/colors/appColors.dart';
import '../../core/images/images.dart';
import '../../generated/l10n.dart';
import 'Provider/homeProvder.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, o, Widget? child) {
        // o is object
        return Scaffold(
          backgroundColor: AppColors.neutral200,
          drawer: Drawer(
            backgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width / 1.25,
            elevation: 0,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkwellCategories(
                      image: Images.labA, screen: const LapWidget()),
                  InkwellCategories(
                      image: Images.airpodsD, screen: const AirpodsWidget()),
                  InkwellCategories(
                      image: Images.watchA, screen: const WatchWidget()),
                  InkwellCategories(
                      image: Images.tvA, screen: const TvWidget()),
                  InkwellCategories(
                      image: Images.phoneA, screen: const PhoneWidget()),
                  InkwellCategories(
                      image: Images.pcB, screen: const PcWidget()),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
          ),
          body: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4.2,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      // borderRadius: BorderRadius.circular(300)
                    ),
                  )),
              Positioned(
                  top: 70,
                  right: -50,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: AppColors.neutral200,
                        borderRadius: BorderRadius.circular(200)),
                  )),
              Positioned(
                  top: -150,
                  right: 90,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(200)),
                  )),
              Positioned(
                  top: 114,
                  left: -20,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: AppColors.neutral200,
                        borderRadius: BorderRadius.circular(200)),
                  )),
              Positioned(
                  top: 40,
                  left: 130,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                  )),
              Positioned(
                top: 0,
                left: 30,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: MediaQuery.of(context).size.height / 13.5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  // color: Colors.white,
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.information400),
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        // counterStyle: TextStyle(color: AppColors.danger600),
                        focusColor: AppColors.primary400,
                        hintText: S.of(context).TypeProductName,
                        hintStyle: TextStyle(color: AppColors.neutral500),
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.information600),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onChanged: (value) => o.homeSearch(value),
                  ),
                ),
              ),
              Positioned(
                  top: 90,
                  left: MediaQuery.of(context).size.width / 15,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.44,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.34,
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            itemCount: o.state.displayList.length,
                            itemBuilder: (context, i) => i % 2 == 0
                                ? Hero(
                                    tag: o.state.displayList[i].salary
                                        .toString(),
                                    child: InkWell(
                                      onTap: () => {
                                        Navigator.of(context).push(o
                                            .buildRoute(o.state.displayList[i]))
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height:
                                            MediaQuery.of(context).size.height / 3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(4, 8))
                                            ],
                                            // border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100,
                                                  top: 10,
                                                  bottom: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<HomeProvider>()
                                                      .onTopfavoriteSaveIcon(
                                                      o.state.iconfavorite,
                                                      i, o.state.displayList[i], context);
                                                },
                                                child: context
                                                    .watch<
                                                    HomeProvider>()
                                                    .state
                                                    .iconfavorite[i] ==
                                                    false
                                                    ? Icon(Iconsax.heart,
                                                    size: 22,
                                                    shadows: const [
                                                      BoxShadow(
                                                          offset: Offset(
                                                              0, 01),
                                                          blurRadius: 2)
                                                    ],
                                                    color: i % 2 == 0
                                                        ? AppColors
                                                        .neutral100
                                                        : AppColors
                                                        .neutral900)
                                                    : Icon(Iconsax.heart5,
                                                    size: 24,
                                                    shadows: const [
                                                      BoxShadow(
                                                          offset: Offset(
                                                              0, 01),
                                                          blurRadius: 2)
                                                    ],
                                                    color: AppColors
                                                        .danger600),
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context).size.height / 7,
                                                child: Image.asset(
                                                    "${o.state.displayList[i].image}")),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              height: 40,
                                              width: MediaQuery.of(context).size.width/2.4,
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "${o.state.displayList[i].name} ",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 23,
                                              margin: EdgeInsets.only(left: 7),
                                              width: MediaQuery.of(context).size.width / 2,
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "${o.state.displayList[i].salary}💲",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        AppColors.success700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 1.34,
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            itemCount: o.state.displayList.length,
                            itemBuilder: (context, i) => i % 2 != 0
                                ? Hero(
                                    tag: o.state.displayList[i].salary
                                        .toString(),
                                    child: InkWell(
                                      onTap: () => {
                                        Navigator.of(context).push(o
                                            .buildRoute(o.state.displayList[i]))
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10, left: 10, right: 10),
                                        height:
                                            MediaQuery.of(context).size.height / 3,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  blurRadius: 5,
                                                  offset: Offset(4, 8))
                                            ],
                                            // border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100,
                                                  top: 10,
                                                  bottom: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<HomeProvider>()
                                                      .onTopfavoriteSaveIcon(
                                                      o.state.iconfavorite,
                                                      i, o.state.displayList[i], context);
                                                },
                                                child: context
                                                    .watch<
                                                    HomeProvider>()
                                                    .state
                                                    .iconfavorite[i] ==
                                                    false
                                                    ? Icon(Iconsax.heart,
                                                    size: 22,
                                                    shadows: const [
                                                      BoxShadow(
                                                          offset: Offset(
                                                              0, 01),
                                                          blurRadius: 2)
                                                    ],
                                                    color: i % 2 == 0
                                                        ? AppColors
                                                        .neutral100
                                                        : AppColors
                                                        .neutral900)
                                                    : Icon(Iconsax.heart5,
                                                    size: 24,
                                                    shadows: const [
                                                      BoxShadow(
                                                          offset: Offset(
                                                              0, 01),
                                                          blurRadius: 2)
                                                    ],
                                                    color: AppColors
                                                        .danger600),
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context).size.height / 7,
                                                child: Image.asset(
                                                    "${o.state.displayList[i].image}")),
                                            Container(
                                              height: 40,
                                              margin: EdgeInsets.only(left: 7),
                                              width: MediaQuery.of(context).size.width/2.4,
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "${o.state.displayList[i].name} ",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              height: 23,
                                              width: MediaQuery.of(context).size.width / 2,
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "${o.state.displayList[i].salary}💲",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900,
                                                    color:
                                                        AppColors.success700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

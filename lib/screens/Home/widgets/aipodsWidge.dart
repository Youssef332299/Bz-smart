import 'package:bzsmart/screens/Home/Provider/homeState.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../generated/l10n.dart';
import '../Provider/homeProvder.dart';

class AirpodsWidget extends StatelessWidget {
  const AirpodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, o, Widget? child) {
        // o is object
        return Scaffold(
          backgroundColor: AppColors.neutral200,
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
                    onChanged: (value) =>
                        o.airpodsSearch(value)
                  ),
                ),
              ),
              Positioned(
                  top: 75,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.23,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: o.state.airpodsList.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        o.buildRoute(o.state.airpodsList[i]));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 20, left: 10, right: 10),
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 6,
                                              offset: Offset(0, 2))
                                        ],
                                        // border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<HomeProvider>()
                                                .onTopfavoriteSaveIcon(
                                                o.state.iconAirpods,
                                                i,
                                                o.state.airpodsList[i],
                                                context);
                                          },
                                          child: context
                                              .watch<HomeProvider>()
                                              .state
                                              .iconAirpods[i] ==
                                              false
                                              ? Icon(Iconsax.heart,
                                              size: 20,
                                              shadows: const [
                                                BoxShadow(
                                                    offset: Offset(0, 01),
                                                    blurRadius: 2)
                                              ],
                                              color: i % 2 == 0
                                                  ? AppColors.neutral100
                                                  : AppColors.neutral900)
                                              : Icon(Iconsax.heart5,
                                              size: 20,
                                              shadows: const [
                                                BoxShadow(
                                                    offset: Offset(0, 01),
                                                    blurRadius: 2)
                                              ],
                                              color: AppColors.danger600),
                                        ),

                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                              "${o.state.airpodsList[i].image}"),
                                        ),
                                         SizedBox(width: MediaQuery.of(context).size.width / 20,),
                                         Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           children: [
                                             Row(
                                               children: [

                                                 Text(
                                                   "${o.state.airpodsList[i].name}",
                                                   style: const TextStyle(
                                                       fontSize: 16,
                                                       fontWeight:
                                                       FontWeight.w800),
                                                 ),
                                               ],
                                             ),
                                             Container(
                                               constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
                                               height: MediaQuery.of(context).size.height / 6,
                                               child: Text(
                                                 "${o.state.airpodsList[i].data}",
                                                 style: TextStyle(
                                                     fontSize: 12,
                                                     fontWeight: FontWeight.w500,
                                                     color: AppColors.information500),
                                               ),
                                             ),
                                             Text(
                                               "${o.state.airpodsList[i].salary}💲",
                                               style: TextStyle(
                                                   fontSize: 18,
                                                   fontWeight: FontWeight.w500,
                                                   color: AppColors.success700),
                                             ),
                                           ],
                                         ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
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

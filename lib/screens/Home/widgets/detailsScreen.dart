// ignore_for_file: must_be_immutable
import 'package:bzsmart/screens/Home/Provider/homeProvder.dart';
import 'package:bzsmart/screens/Home/homeScreen.dart';
import 'package:bzsmart/screens/cart/provider/cardProvider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../data/model/products/productsModel.dart';
import '../../../generated/l10n.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.items});

  ProductModel items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   // actions: [
      //   //   Padding(
      //   //     padding: const EdgeInsets.all(8.0),
      //   //     child: Icon(Icons.abc),
      //   //   )
      //   // ],
      //   title: Text(items.name!,
      //       style: TextStyle(
      //           color: AppColors.information300,
      //           fontSize: 20,
      //           fontWeight: FontWeight.w700)),
      //   elevation: 40,
      //   backgroundColor: Colors.black,
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(items.name!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Iconsax.arrow_down)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Hero(
                  tag: items.salary!,
                  child: Image.asset("${items.image}"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 20,
              ),
              alignment: Alignment.center,
              child: Text(
                items.data!,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 30, bottom: 20),
              child: Text(
                "${items.salary}💲",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: AppColors.success600,
                    fontFamily: "DancingScript"),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if(Provider.of<HomeProvider>(context,listen: false).state.interstitialAd != null){
                  Provider.of<HomeProvider>(context,listen: false).state.interstitialAd!.show();
                }
                context.read<CartProvider>().addToCart(items,context);
              },
              height: MediaQuery.of(context).size.height / 12,
              minWidth: MediaQuery.of(context).size.width / 1.3,
              elevation: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              splashColor: AppColors.information200,
              color: Colors.black,
              child: Text(S.of(context).addToCart,
                  style: TextStyle(
                      color: AppColors.information300,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

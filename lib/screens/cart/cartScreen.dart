import 'dart:io';

import 'package:bzsmart/core/colors/appColors.dart';
import 'package:bzsmart/screens/cart/provider/cardProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
        builder: (context, o, child) => Scaffold(
              backgroundColor: AppColors.neutral200,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    o.state.cart.isEmpty
                        ? Container(
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.of(context).size.height / 2.4,
                            child: Text(
                              S.of(context).dontHave,
                              style: TextStyle(
                                  color: AppColors.neutral600,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ))
                        : SizedBox(
                            height: o.state.cart.length * MediaQuery.of(context).size.height / 4.2,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: o.state.cart.length,
                              itemBuilder: (context, i) => Card(
                                borderOnForeground: true,
                                shadowColor: AppColors.information300,
                                elevation: 10,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.neutral300, width: 3),
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 7,
                                      width: MediaQuery.of(context).size.width / 2,
                                      child:
                                          Image.asset(o.state.cart[i].image!),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          height: MediaQuery.of(context).size.height / 10,
                                          width: MediaQuery.of(context).size.width / 3,
                                          child: Text(o.state.cart[i].name!,style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: AppColors.neutral500,
                                          ),),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              11,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Text(
                                            "${o.state.cart[i].salary}💲",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              color: AppColors.success600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          o.removeFromCart(
                                              i,
                                              o.state.cart[i].salary!
                                                  .toDouble());
                                        },
                                        icon: Icon(
                                          Icons.highlight_remove,
                                          color: AppColors.danger500,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${S.of(context).total}: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            color: AppColors.neutral900,
                          ),
                        ),
                        Text(
                          "${o.state.total}💲",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: AppColors.success600,
                          ),
                        ),
                      ],
                    ),
                    Center(
                        child: Platform.isIOS
                            ? o.state.applePayButton
                            : o.state.googlePayButton),
                  ],
                ),
              ),
            ));
  }
}

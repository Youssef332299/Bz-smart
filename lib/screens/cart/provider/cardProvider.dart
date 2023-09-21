import 'dart:ffi';

import 'package:bzsmart/screens/cart/provider/cardState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/model/products/productsModel.dart';
import '../../../generated/l10n.dart';

class CartProvider extends ChangeNotifier{
  CartState state = CartState();

  void addToCart(ProductModel item,context){

    state.cart.add(ProductModel(
        name: item.name,
        image: item.image,
        data: item.data,
        salary: item.salary));
    state.total += item.salary!;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).addToCart)));
    notifyListeners();
  }

  void removeFromCart(i, double salary){
    print(state.total);
    state.total = state.total - salary;
    print(state.total);
    state.cart.removeAt(i);
    notifyListeners();
  }

}
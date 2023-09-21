import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/images/images.dart';
import '../components/onboardingWidget.dart';

class OnboaridngState {
  int pageIndex = 0;

  PageController scroll = PageController(initialPage: 0);

  List<Widget> boaridngWidgets = [
    OnboardingWidget(image: Images.onlineStore, title: "Online store"),
    OnboardingWidget(image: Images.delivery, title: "Fast delivery"),
    OnboardingWidget(image: Images.visa, title: "Paypal"),
  ];

  List<Widget> arabicBoaridngWidgets = [
    OnboardingWidget(image: Images.onlineStore, title: "متجر الكتروني"),
    OnboardingWidget(image: Images.delivery, title: "توصيل سريع"),
    OnboardingWidget(image: Images.visa, title: "الدفع باستخدام البطاقة البنكية"),
  ];

}

import 'package:bzsmart/core/colors/appColors.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral200,
      appBar: AppBar(
        backgroundColor: AppColors.neutral200,
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Text(S.of(context).followOrder,style: const TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Text(S.of(context).maps,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: AppColors.neutral600
        ),),
      ),
    );
  }
}

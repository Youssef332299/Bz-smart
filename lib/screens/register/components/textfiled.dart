import 'package:flutter/material.dart';
import '../../../core/colors/appColors.dart';

// ignore: must_be_immutable
class TexField extends StatelessWidget {
    TexField({super.key,this.icon, this.hint});

    String? hint;
  Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 23, left: 23),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.information300),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hint!,
          hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.neutral400),
          prefixIcon: icon!,
        ),
      ),);
  }
}

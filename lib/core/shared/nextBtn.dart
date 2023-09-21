import 'package:flutter/material.dart';
import '../colors/appColors.dart';


class NextButton extends StatelessWidget {
  // final String textBtn;
  final void Function()? onPressed;
  final String? text;

  const NextButton({super.key, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: MediaQuery.of(context).size.height / 12,
      minWidth: MediaQuery.of(context).size.width / 1.3,
      elevation: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: AppColors.information200,
      color: Colors.black,
      child: Text("$text",
          style: TextStyle(
              color: AppColors.information300,
              fontSize: 18,
              fontWeight: FontWeight.w700)),
    );
  }
}

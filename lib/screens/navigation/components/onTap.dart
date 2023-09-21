import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class OnTap extends StatelessWidget {
  OnTap({super.key, this.text, this.icon});

  IconData? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 14,
          width: MediaQuery.of(context).size.width / 5.5,
          margin: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(offset: Offset(0, 2),blurRadius: 30)
            ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)

          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ).animate().scale(
              end: const Offset(1.2, 1.2,),)
              .slideY(end: -.4),
        Text(
          text!,
          style: const TextStyle(
              fontWeight: FontWeight.w800, fontSize: 11, color: Colors.black),
        ),
      ],
    );
  }
// }
}

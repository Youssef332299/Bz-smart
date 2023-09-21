// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';


class InkwellCategories extends StatelessWidget {
   InkwellCategories({super.key, required this.image, required this.screen});

  String? image;
  Widget? screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => screen!));
          },
    child: Container(
        height: MediaQuery.of(context).size.height / 5,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(),
        alignment: Alignment.center,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image!,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, this.buttonTitle, this.onTap});

  final String? buttonTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: const Color(0xFFEB1555),
          margin: const EdgeInsets.only(top: 10.0),
          height: kBottomContainerHeight,
          width: double.infinity,
          child:  Center(
            child: Text(
              buttonTitle.toString(),
              style: kLargeButtonTextStyle,
            ),
          )),
    );
  }
}
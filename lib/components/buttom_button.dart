import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonText, required this.onTap});

  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kCalculateButton,
          ),
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: const Color(0xFFb09cf8),
          //color: const Color(0xFF7c72db),
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}

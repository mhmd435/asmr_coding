
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final Color backgroundColor;
  final Function() onTap;
  final String text;
  final Color fontColor;
  const ChipWidget({super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 3),
        label: Text(
          text,
          style: TextStyle(
            color: fontColor,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.black)
        ),
        backgroundColor: backgroundColor,
        elevation: 5.0,
        shadowColor: Colors.grey,
      ),
    );
  }
}

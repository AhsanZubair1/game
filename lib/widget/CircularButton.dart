import 'package:flutter/material.dart';
class CircularButton extends StatelessWidget {
  CircularButton(
      {required this.width,
        required this.height,
        required this.color,
        required this.icon,
        required this.onclick});

  final double height;
  final double width;
  final Color color;
  final Icon icon;
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: width,
      height: height,
      child: IconButton(
        icon: icon,
        enableFeedback: true,
        onPressed: () {
          print("bbb b");

        },
      ),
    );
  }


}
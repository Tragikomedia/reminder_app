import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  MyText({@required this.text, this.color=secondaryColor, this.size=12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}

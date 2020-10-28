import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final bool softWrap;

  MyText({@required this.text, this.softWrap=false, this.color=primaryColor, this.size=12});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Text(
        text,
        softWrap: softWrap,
        style: TextStyle(
          fontSize: size,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 4
            ..color = secondaryColor
        ),
      ),
      Text(
        text,
        softWrap: softWrap,
        style: TextStyle(
          fontSize: size,
          color: color
        ),
      )]
    );
  }
}

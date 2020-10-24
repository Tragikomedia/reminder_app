import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/my_text.dart';

class PickDateBox extends StatelessWidget {
  final String text;
  final String date;
  final Function onTap;

  PickDateBox({@required this.text, @required this.onTap, @required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(text: text),
        Spacer(),
        MyText(
          text: date,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.schedule,
            color: secondaryColor,
          ),
        )
      ],
    );
  }
}

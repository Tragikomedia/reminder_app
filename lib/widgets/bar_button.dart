import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/my_text.dart';

class BarButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color buttonColour;
  final Color textColor;

  BarButton({@required this.text, @required this.onPressed, this.buttonColour=buttonColor, this.textColor=primaryColor});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: onPressed,
      color: buttonColour,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: MyText(
        text: text,
        color: textColor,
        size: 20.0,
      ),
    );
  }
}

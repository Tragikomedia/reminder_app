import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';

class DiscardButton extends StatelessWidget {
  final bool isDone;

  DiscardButton(
  {@required this.isDone}
      );

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.clear,
      size: 30.0,
      color: isDone ? borderColor : Colors.red,
    );
  }
}

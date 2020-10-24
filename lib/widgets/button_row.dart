import 'package:flutter/material.dart';
import 'package:reminder_app/widgets/bar_button.dart';

class ButtonRow extends StatelessWidget {
  final List<BarButton> buttons;

  ButtonRow({@required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

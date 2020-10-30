import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<Widget> buttons;

  ButtonRow({@required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}

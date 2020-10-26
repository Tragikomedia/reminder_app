import 'package:flutter/material.dart';

import 'bar_button.dart';
import 'button_row.dart';

class AddCancelButtons extends StatelessWidget {
  final Function addTask;

  AddCancelButtons({@required this.addTask});

  @override
  Widget build(BuildContext context) {
    return ButtonRow(
      buttons: [
        BarButton(text: 'CANCEL', onPressed: () {
          Navigator.pop(context);
        }),
        BarButton(text: 'ADD', onPressed: addTask)
    ],
    );
  }
}

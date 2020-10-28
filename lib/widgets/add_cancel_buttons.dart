import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'bar_button.dart';
import 'button_row.dart';

class AddCancelButtons extends StatelessWidget {
  final Function addTask;

  AddCancelButtons({@required this.addTask});

  @override
  Widget build(BuildContext context) {
    return ButtonRow(
      buttons: [
        Spacer(),
        BarButton(text: 'cancel'.tr(), onPressed: () {
          Navigator.pop(context);
        }),
        Spacer(),
        BarButton(text: 'add'.tr(), onPressed: addTask),
        Spacer()
    ],
    );
  }
}

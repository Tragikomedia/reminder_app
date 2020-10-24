import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/my_text.dart';

class TaskNameBox extends StatelessWidget {
  final TextEditingController controller;

  TaskNameBox({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyText(text: 'Task name: '),
        Expanded(
          child: TextField(
            controller: controller,
            maxLength: 80,
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/utilities/consts.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:easy_localization/easy_localization.dart';

class TaskNameBox extends StatelessWidget {
  final TextEditingController controller;

  TaskNameBox({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: 'name'.tr() + ' ', color: primaryColor, size: kAddLabelSize,),
        Expanded(
          child: TextField(
            cursorColor: backgroundColor,
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: 'input'.tr(),
                hintStyle: TextStyle(
                  color: primaryColor,
                  fontSize: kAddInputSize
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor)),
                border: InputBorder.none),
            controller: controller,
            style: TextStyle(
              color: primaryColor,
              fontSize: kAddInputSize,
              textBaseline: TextBaseline.alphabetic
            ),
          ),
        )
      ],
    );
  }
}

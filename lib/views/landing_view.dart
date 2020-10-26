import 'package:flutter/material.dart';
import 'package:reminder_app/handlers/db_handler.dart';
import 'package:reminder_app/utilities/colors.dart';
import 'package:reminder_app/widgets/bottom_bar.dart';
import 'package:reminder_app/widgets/my_text.dart';
import 'package:reminder_app/widgets/task_list.dart';

class LandingView extends StatefulWidget {
  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkerColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(text: 'TASKS', color: primaryColor, size: 40.0,),
            Divider(color: secondaryColor,),
            Flexible(child: TaskList()),
            Divider(color: secondaryColor,),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}

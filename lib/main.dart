import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/views/landing_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TaskProvider(), child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "ProstoOne"
      ),
      home: LandingView(),
    ));
  }
}


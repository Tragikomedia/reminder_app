import 'package:flutter/material.dart';
import 'package:reminder_app/views/landing_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LandingView(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/views/landing_view.dart';

class LoadingView extends StatefulWidget {
  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize(context);
    });
  }

  _initialize(BuildContext context) async {
    await Provider.of<TaskProvider>(context, listen: false).fillTaskList();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LandingView()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

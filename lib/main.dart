import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/views/landing_view.dart';
import 'package:reminder_app/views/loading_view.dart';

import 'handlers/db_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
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
      home: LoadingView(),
    ));
  }
}


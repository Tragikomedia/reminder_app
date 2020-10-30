import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/provider/task_provider.dart';
import 'package:reminder_app/views/loading_view.dart';
import 'handlers/db_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('pl')],
      path: 'translations',
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: MaterialApp(
          title: 'TaskReminder',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: "ProstoOne",
          cursorColor: Colors.red,
          primarySwatch: Colors.red,
          textTheme: TextTheme(

          ),
          textSelectionHandleColor: Colors.red,
          timePickerTheme: TimePickerThemeData(
            dialHandColor: Colors.red,
            hourMinuteTextColor: Colors.red,
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
                )
              ),
              hourMinuteColor: Colors.redAccent.shade50
          )),
          home: LoadingView(),
        ));
  }
}

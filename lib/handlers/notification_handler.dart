import 'package:reminder_app/models/task.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:easy_localization/easy_localization.dart';

void callbackDispatcher() {
  Workmanager.executeTask((taskName, inputData) {
    FlutterLocalNotificationsPlugin notification =
        FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var settings = InitializationSettings(android: android);
    notification.initialize(settings);
    _showNotificationWithDefaultSound(
        notification, inputData ?? {'name': 'Unknown', 'id': 999});
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(
    var notification, Map<String, dynamic> inputData) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id', 'channel name', 'channel description',
      importance: Importance.max, priority: Priority.high);

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  await notification.show(
      inputData['id'],
          inputData['title'],
          inputData['message'] + inputData['name'],
      platformChannelSpecifics,
      payload: 'Default_Sound');
}

void registerTask(Task task) {
  DateTime now = DateTime.now();
  String id = '${task.name}_${task.number.toString()}';
  String title = 'messagetitle'.tr();
  Map<String, dynamic> inputData = {
    'name': task.name,
    'id': task.number,
    'title' : title
  };
  String message;
  if (task.start.isAfter(now)) {
    message = 'messageoffset'.tr();
    inputData['message'] = message;
    Workmanager.registerOneOffTask('${id}_offset', '${task.name}_offset',
        tag: id,
        initialDelay: task.start.difference(now),
        inputData: inputData);
  }
  message = 'messagenormal'.tr();
  inputData['message'] = message;
  Workmanager.registerOneOffTask(id, task.name,
      tag: id, initialDelay: task.end.difference(now), inputData: inputData);
}

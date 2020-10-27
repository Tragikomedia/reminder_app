import 'package:reminder_app/utilities/enums.dart';

class ShownTimeHandler {
  static String convertTickToText(bool isDone, int timeInSeconds, int counter) {
    if (isDone) {
      return "Done";
    }
    int diffInSec = timeInSeconds - counter;
    int hours = diffInSec ~/ 3600;
    diffInSec -= hours * 3600;
    int minutes = diffInSec ~/ 60;
    diffInSec -= minutes * 60;
    int seconds = diffInSec;
    return (_getTextFromTime(hours, TimeDiv.hour) +
        _getTextFromTime(minutes, TimeDiv.minute) +
        _getTextFromTime(seconds, TimeDiv.second));
  }

  static String _getTextFromTime(int time, TimeDiv type) {
    switch (type) {
      case TimeDiv.hour:
        return time == 0 ? "" : time.toString() + ":";
      case TimeDiv.minute:
        return time.toString().padLeft(2, '0') + ":";
      default:
        return time.toString().padLeft(2, '0');
    }
  }
}

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mymgs/data/settings.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void scheduleReminder(int id, {
  required String title,
  required String subtitle,
  required NotificationDetails notificationDetails,
  required DateTime when,
  bool recursWeekly = false,
}) {
  tz.initializeTimeZones();
  final location = tz.getLocation("Europe/London");
  tz.setLocalLocation(location);

  final scheduleTime = tz.TZDateTime.from(when, location);
  if (scheduleTime.isBefore(tz.TZDateTime.now(location))) {
    return;
  }

  flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    subtitle,
    scheduleTime,
    notificationDetails,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    androidAllowWhileIdle: true,
    matchDateTimeComponents: recursWeekly ? DateTimeComponents.dayOfWeekAndTime : null,
  );
}

void cancelReminder(int id) {
  flutterLocalNotificationsPlugin.cancel(id);
}

Future<List<int>> getHomeworkReminderTime() async {
  final string = await getSetting<String?>('homework_reminder_time');
  if (string == null) {
    return [18, 00];
  }

  return string.split(':').map((e) => int.parse(e)).toList();
}

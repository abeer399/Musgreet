// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/timezone.dart' as tz;

// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   static final onNotification = BehaviorSubject<String>();
//   static Future _notificationDetails() async {
//     return NotificationDetails(
//         android: AndroidNotificationDetails(
//             'channal id', 'channal title', 'channal body',
//             importance: Importance.max),
//         iOS: IOSNotificationDetails());
//   }

//   static Future init({bool initSchedule = false}) async {
//     final android = AndroidInitializationSettings('@ipmap/ic_launcher');
//     final ios = IOSInitializationSettings();
//     final settings = InitializationSettings(android: android, iOS: ios);
//     await _notifications.initialize(settings,
//         onSelectNotification: (payload) async {});
//   }

//   static Future showNotification({
//     int id = 0,
//     String title,
//     String body,
//     String payload,
//   }) async =>
//       _notifications.show(id, title, body, await _notificationDetails());

//   static Future showMonthlyNotification({
//     int id = 0,
//     String title,
//     String body,
//     String payload,
//     @required DateTime scheduleDate,
//   }) async =>
//       _notifications.zonedSchedule(
//         id,
//         title,
//         body,
//         _scheduleMonthly(Time(8)),
//         await _notificationDetails(),
//         payload: payload,
//         androidAllowWhileIdle: true,
//         matchDateTimeComponents: DateTimeComponents.time,
//         uiLocalNotificationDateInterpretation: null,
//       );
//   static tz.TZDateTime _scheduleMonthly(Time time) {
//     final now = tz.TZDateTime.now(tz.local);
//   }
// }

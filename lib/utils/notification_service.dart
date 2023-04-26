import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print(token);

    firebaseMessaging.subscribeToTopic("PEPE");
    firebaseMessaging.subscribeToTopic("PEPE2");
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }

  static _onMessage(RemoteMessage message) async {
    print(1);
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onBackgroundMessage(RemoteMessage message) async {
    print(2);
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async {
    print(3);
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    FirebaseMessaging.onMessage.listen(_onMessage);
  }

  static _onMessage(RemoteMessage message) async {
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}

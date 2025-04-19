import 'package:flutter/material.dart';
import 'package:pelayanan_desa/screens/splash_screen.dart';
import 'routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  runApp(WonoAccessApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('📩 Notifikasi background: ${message.notification?.title}');
}

class WonoAccessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WonoAccess',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}

class UserModel {
  String name;
  String nik;
  String email;
  String phone;
  String address;

  UserModel({
    required this.name,
    required this.nik,
    required this.email,
    required this.phone,
    required this.address,
  });
}

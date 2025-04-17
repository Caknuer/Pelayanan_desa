import 'package:flutter/material.dart';
import 'package:pelayanan_desa/screens/splash_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(WonoAccessApp());
}

class WonoAccessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WonoAccess',
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

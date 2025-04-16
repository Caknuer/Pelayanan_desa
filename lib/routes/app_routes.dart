import 'package:flutter/material.dart';
import 'package:pelayanan_desa/screens/form_kk_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/form_permohonan_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String formKTP = '/formKTP';
  static const String formKK = '/formKK';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    home: (context) => HomePage(),
    formKTP: (context) => FormPermohonanScreen(),
    formKK: (context) => FormKKScreen(),
  };
}

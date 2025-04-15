import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(PelayananDesaApp());
}

class PelayananDesaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pelayanan Desa',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}

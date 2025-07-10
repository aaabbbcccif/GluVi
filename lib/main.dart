import 'package:flutter/material.dart';
import 'package:gluvi/pages/AuthorizationApp.dart';
import 'package:gluvi/pages/RegistrationApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthorizationApp(),
        '/reg': (context) => RegistrationApp()
      },
      debugShowCheckedModeBanner: false,
      title: 'GluVi',
      home: AuthorizationApp(),
      theme: ThemeData()
    );
  }
}







import 'package:flutter/material.dart';
import 'package:gluvi/pages/AuthorizationApp.dart';
import 'package:gluvi/pages/RegistrationApp.dart';
import 'package:gluvi/pages/BNBar.dart';

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
        '/reg': (context) => RegistrationApp(),
        '/bnbar': (context) => BNBar(),
      },
      debugShowCheckedModeBanner: false,
      title: 'GluVi',
      home: AuthorizationApp(),
      theme: ThemeData()
    );
  }
}







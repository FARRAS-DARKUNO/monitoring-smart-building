import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/screen/detail_screen.dart';
import 'package:itera_monitoring_ac/screen/home_screen.dart';
import 'package:itera_monitoring_ac/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

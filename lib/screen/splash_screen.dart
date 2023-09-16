import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/size.dart';

import '../global/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: sWidthFull(context),
        height: sHeightFull(context),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(2, 1),
            colors: <Color>[cPremier, cSekunder],
          ),
        ),
      ),
    );
  }
}

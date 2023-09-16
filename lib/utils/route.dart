import 'package:flutter/cupertino.dart';
import 'package:itera_monitoring_ac/screen/detail_screen.dart';
import 'package:itera_monitoring_ac/screen/home_screen.dart';
import 'package:itera_monitoring_ac/screen/login_screen.dart';
import 'package:itera_monitoring_ac/screen/splash_screen.dart';

gotoHome(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const HomeScreen(),
  ));
}

gotoLogin(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => LoginScreen(),
  ));
}

gotoDetail(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const DetailScreen(),
  ));
}

gotoSplashScreen(BuildContext context) {
  Navigator.of(context).push(CupertinoPageRoute<void>(
    builder: (BuildContext context) => const SplashScreen(),
  ));
}

gotoBack(BuildContext context) {
  Navigator.of(context).pop();
}

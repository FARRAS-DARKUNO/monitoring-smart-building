import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthFull(context),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Welcome to,\nMonitoring Room', style: h2(cBlack)),
          const CircleAvatar(
            radius: 20,
            backgroundColor: cPremier,
            child: Icon(
              Icons.run_circle_outlined,
              color: cWhite,
              size: 34,
            ),
          )
        ],
      ),
    );
  }
}

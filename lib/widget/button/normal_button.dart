import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class NormalButton extends StatelessWidget {
  final String title;
  const NormalButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sWidthFull(context) - 40,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1, 0),
          colors: <Color>[cPremier, cSekunder],
        ),
      ),
      child: Text(title, style: h1(cWhite)),
    );
  }
}

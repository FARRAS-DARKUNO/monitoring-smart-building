import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      height: 170,
      width: sWidthFull(context),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment(1, 0),
          colors: <Color>[cPremier, cSekunder],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Status room : ', style: h4(cWhite)),
              Text('online', style: h5(cGreen))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('222', style: people(cWhite)),
              Text('People', style: body(cWhite)),
            ],
          ),
          Text('With 24 °C in this room', style: h4(cWhite)),
        ],
      ),
    );
  }
}

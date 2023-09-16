import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/utils/route.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoDetail(context),
      child: Container(
        width: sWidthFull(context),
        height: 210,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1, 0),
            colors: <Color>[cPremier, cSekunder],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: sWidthFull(context),
          height: sHeightFull(context),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://www.justcoglobal.com/wp-content/uploads/2022/06/meeting-rooms.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: sWidthFull(context),
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment(1, 1),
                colors: <Color>[Colors.transparent, cBlack],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ruangan A22113', style: h2(cWhite)),
                Text(
                  'Gedung A lantai 1 Institut Teknologi Sumatera',
                  style: h5(cWhite),
                ),
                Container(
                  height: 2,
                  width: sWidthFull(context),
                  color: cWhite,
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Device : ', style: body(cWhite)),
                    Text('12 online ', style: body(cGreen)),
                    Text('1 offline ', style: body(cRed)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

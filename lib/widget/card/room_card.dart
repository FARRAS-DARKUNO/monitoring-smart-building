import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/data/model/room/room_model.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/utils/route.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({required this.room, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoDetail(context, room.id),
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
            image: DecorationImage(
              image: NetworkImage(room.image),
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
                Text(room.name, style: h2(cWhite)),
                Text(
                  room.description,
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
                    Text('People : ', style: body(cWhite)),
                    Text(room.people_count, style: body(cGreen)),
                    // Text('1 offline ', style: body(cRed)),
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

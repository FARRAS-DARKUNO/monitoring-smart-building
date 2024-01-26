import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/data/model/room/room_model.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/utils/route.dart';

class RoomCard extends StatefulWidget {
  final Data room;
  const RoomCard({required this.room, super.key});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  dynamic dataMonitor = 0;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Timer? timer;

  getData() async {
    final snapshotControl = await ref.child(widget.room.people_count).get();
    print("Masuk lah kali ya");
    if (snapshotControl.exists) {
      setState(() {
        if (mounted) {
          dataMonitor = snapshotControl.value ;
        }
      });
      print(snapshotControl.value);
    } else {
      print('No data available.');
    }
  }

  void _refreshPage() {
    getData();
  }

  @override
  void initState() {
    super.initState();

    getData();
    timer =
        Timer.periodic(const Duration(seconds: 2), (Timer t) => _refreshPage());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => gotoDetail(context, widget.room.id),
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
              image: NetworkImage(widget.room.image),
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
                Text(widget.room.name, style: h2(cWhite)),
                Text(
                  widget.room.description,
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
                    Text('$dataMonitor', style: body(cGreen)),
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

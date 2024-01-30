import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/fonts.dart';
import '../../global/size.dart';

class PeopleCard extends StatefulWidget {
  final String peeople;
  final String status;
  const PeopleCard({required this.peeople, required this.status, super.key});

  @override
  State<PeopleCard> createState() => _PeopleCardState();
}

class _PeopleCardState extends State<PeopleCard> {
  bool cStatus = true;
  dynamic cpeeople = 0;

  DatabaseReference ref = FirebaseDatabase.instance.ref();

  Timer? timer;

  getData() async {
    final snapshotpeopele = await ref.child(widget.peeople).get();
    final snapshotStattus = await ref.child(widget.status).get();
    print("Masuk lah kali ya");
    if (snapshotpeopele.exists) {
      setState(() {
        if (mounted) {
          cpeeople = snapshotpeopele.value;
        }
      });
      print(snapshotpeopele.value);
    } else {
      print('No data available.');
    }
    if (snapshotStattus.exists) {
      setState(() {
        if (mounted) {
          cStatus = snapshotStattus.value as bool;
        }
      });
      print(snapshotStattus.value);
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
        Timer.periodic(const Duration(seconds: 3), (Timer t) => _refreshPage());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
              Text(cStatus ? 'online' : 'offline',
                  style: h5(cStatus ? cGreen : cRed))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('$cpeeople', style: people(cWhite)),
              Text('People', style: body(cWhite)),
            ],
          ),
          // Text('With 24 °C in this room', style: h4(cWhite)),
        ],
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/widget/card/card_monitoring.dart';
import 'package:itera_monitoring_ac/widget/card/people_card.dart';
import 'package:itera_monitoring_ac/widget/header/detail_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    print("hallo");
    print(ref.toString());
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 4.3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Column(
        children: [
          const DetailHeader(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: sWidthFull(context),
            height: sHeightFull(context) - 250,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final snapshot = await ref.child('ac-2-controller').get();
                      if (snapshot.exists) {
                        print(snapshot.value);
                      } else {
                        print('No data available.');
                      }
                      // print(ref.get());
                      ref.onValue.listen((DatabaseEvent event) {
                        final data = event.snapshot.value;
                        print(data);
                      });
                    },
                    child: const PeopleCard(),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (itemWidth / itemHeight),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: [
                      CardMonitoring(name: "ac-1-controller", size: size),
                      CardMonitoring(name: "ac-2-controller", size: size),
                      CardMonitoring(name: "lamp-1-controller", size: size),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('AlertDialog Title'),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                Text('Humadity', style: h2(cPremier)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('OFF', style: h1(cRed)),
                    Switch(
                      activeColor: cGreen,
                      inactiveThumbColor: cRed,
                      value: false,
                      onChanged: (bool value) {
                        setState(() {});
                      },
                    ),
                    Text('ON', style: h1(cGreen)),
                  ],
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Widget> data(BuildContext context, Size size, String name) async {
    final snapshot = await ref.child('ac-2-controller').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    return UnicornOutlineButton(
      onPressed: () => showMyDialog(context),
      strokeWidth: 6,
      radius: 30,
      gradient: const LinearGradient(colors: [cPremier, cSekunder]),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width / 2 - 60,
              child: Text(
                name,
                style: h4(cBlack),
                textAlign: TextAlign.center,
              ),
            ),
            Text('18', style: h1(cSekunder)),
            Column(
              children: [
                Text('Persen', style: h4(cBlack)),
                Row(
                  children: [
                    Text('Status : ', style: h4(cBlack)),
                    Text('online', style: h4(cGreen)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


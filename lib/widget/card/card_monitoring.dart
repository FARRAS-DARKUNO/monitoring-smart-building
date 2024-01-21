import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';

class CardMonitoring extends StatefulWidget {
  final Size size;
  final String name;
  final String monitoring;
  final String controlliing;
  final String unit;
  const CardMonitoring(
      {required this.controlliing,
      required this.name,
      required this.monitoring,
      required this.unit,
      required this.size,
      super.key});

  @override
  State<CardMonitoring> createState() => _CardMonitoringState();
}

class _CardMonitoringState extends State<CardMonitoring> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  bool isCheck = false;
  dynamic dataMonitor = 0;
  Timer? timer;

  getData() async {
    final snapshotControl = await ref.child(widget.controlliing).get();
    final snapshotMonitor = await ref.child(widget.monitoring).get();
    print("Masuk lah kali ya");
    if (snapshotControl.exists) {
      setState(() {
        if (mounted) {
          isCheck = snapshotControl.value as bool;
        }
      });
      print(snapshotControl.value);
    } else {
      print('No data available.');
    }
    if (snapshotMonitor.exists) {
      setState(() {
        if (mounted) {
          dataMonitor = snapshotMonitor.value ;
        }
      });
      print(snapshotMonitor.value);
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
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _refreshPage());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnicornOutlineButton(
      onPressed: () async {
        await ref.update({widget.controlliing: !isCheck}).then((value) {
          setState(() {
            isCheck = !isCheck;
          });
        });
        // showMyDialog(context);
      },
      strokeWidth: 6,
      radius: 30,
      gradient: const LinearGradient(colors: [cPremier, cSekunder]),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widget.size.width / 2 - 60,
              child: Text(
                widget.controlliing,
                style: h4(cBlack),
                textAlign: TextAlign.center,
              ),
            ),
            Text('$dataMonitor', style: h1(cSekunder)),
            Column(
              children: [
                Text(widget.unit, style: h4(cBlack)),
                Row(
                  children: [
                    Text('Status : ', style: h4(cBlack)),
                    Text(isCheck ? "Online" : "Offline",
                        style: h4(isCheck ? cGreen : cRed)),
                  ],
                ),
              ],
            )
          ],
        ),
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
                      value: isCheck,
                      onChanged: (bool value) {
                        setState(() {
                          isCheck = value;
                        });
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
}

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;

  UnicornOutlineButton({
    super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            constraints: const BoxConstraints(minWidth: 88, minHeight: 48),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

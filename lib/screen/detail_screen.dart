import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/widget/card/people_card.dart';
import 'package:itera_monitoring_ac/widget/header/detail_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

  @override
  Widget build(BuildContext context) {
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
                  const PeopleCard(),
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
                      data(context, size),
                      data(context, size),
                      data(context, size),
                      data(context, size),
                      data(context, size),
                      data(context, size),
                      data(context, size),
                      data(context, size),
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

  Widget data(BuildContext context, Size size) {
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
                'Humidityaaaaaaaaasaaaaa Humidity Humidity ',
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

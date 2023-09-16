import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/fonts.dart';
import '../../global/colors.dart';
import '../../global/size.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String tag;
  final String title;
  final bool isPassword;
  const TextInput({
    required this.controller,
    required this.tag,
    required this.title,
    required this.isPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sWidthDynamic(context, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(title, style: h5(cBlack)),
          ),
          Container(
            width: sWidthDynamic(context, 0.9),
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 2, color: cPremier),
            ),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              enableSuggestions: !isPassword,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: tag,
              ),
            ),
          )
        ],
      ),
    );
  }
}

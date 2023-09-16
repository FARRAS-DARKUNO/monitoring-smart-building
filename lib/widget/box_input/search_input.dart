import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';

import '../../global/size.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({required this.controller, required this.tag, super.key});

  final TextEditingController controller;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sWidthDynamic(context, 1) - 40,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(width: 1.5, color: cPremier),
      ),
      child: TextField(
        controller: controller,
        autocorrect: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: tag,
        ),
      ),
    );
  }
}

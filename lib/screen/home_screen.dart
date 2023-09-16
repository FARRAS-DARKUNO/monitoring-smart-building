import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/global/size.dart';
import 'package:itera_monitoring_ac/widget/box_input/search_input.dart';
import 'package:itera_monitoring_ac/widget/card/room_card.dart';
import 'package:itera_monitoring_ac/widget/header/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: sHeightFull(context),
            width: sWidthFull(context),
            color: cWhite,
            child: Column(
              children: [
                const HomeHeader(),
                SearchInput(
                  controller: searchController,
                  tag: 'Search room...',
                ),
                const SizedBox(height: 10),
                Container(
                  width: sWidthFull(context),
                  height: sHeightScreenComments(context) - 145,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                  ),
                  child: ListView(
                    children: const <Widget>[
                      RoomCard(),
                      RoomCard(),
                      RoomCard(),
                      RoomCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

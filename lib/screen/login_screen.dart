import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/utils/route.dart';
import 'package:itera_monitoring_ac/widget/box_input/text_input.dart';
import 'package:itera_monitoring_ac/widget/button/normal_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 100, width: 100, color: cBlack),
                const SizedBox(height: 50),
                TextInput(
                  controller: usernameController,
                  tag: 'Username',
                  title: 'username',
                  isPassword: false,
                ),
                TextInput(
                  controller: usernameController,
                  tag: 'Password',
                  title: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () => gotoHome(context),
                  child: const NormalButton(title: 'Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

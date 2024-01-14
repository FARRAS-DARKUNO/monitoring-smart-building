import 'package:flutter/material.dart';
import 'package:itera_monitoring_ac/data/repositories/auth/auth_repository.dart';
import 'package:itera_monitoring_ac/global/colors.dart';
import 'package:itera_monitoring_ac/utils/route.dart';
import 'package:itera_monitoring_ac/widget/alert/alert_dynamic.dart';
import 'package:itera_monitoring_ac/widget/box_input/text_input.dart';
import 'package:itera_monitoring_ac/widget/button/normal_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLoading = false;

  validationAuth() async {
    setState(() => isLoading = true);
    await AuthRepository()
        .postLogin(usernameController.text, passwordController.text)
        .then((value) {
      print(value.data);
      if (value.status == 400) {
        alertDynamic(context, "Error", "Someting wes wrong");
        setState(() => isLoading = false);
      } else {
        gotoHome(context);
      }
    });
  }

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
                  controller: passwordController,
                  tag: 'Password',
                  title: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () => isLoading ? null : validationAuth(),
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

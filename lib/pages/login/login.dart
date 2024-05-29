import 'package:acar/pages/login/parts/code_field.dart';
import 'package:acar/pages/login/parts/login_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController codeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CodeField(codeCtrl: codeCtrl),
          const SizedBox(height: 20),
          LoginButton(codeCtrl: codeCtrl),
        ],
      ),
    );
  }
}

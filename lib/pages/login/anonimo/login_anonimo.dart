import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginAnonimo extends StatelessWidget {
  const LoginAnonimo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade200,
      child: Center(
        child: ButtonWidget(textButton: 'login anonimo', ontap: () {}),
      ),
    );
  }
}

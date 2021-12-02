import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginGoogle extends StatelessWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent.shade200,
      child: Center(
        child: ButtonWidget(textButton: 'login Google', ontap: () {}),
      ),
    );
  }
}

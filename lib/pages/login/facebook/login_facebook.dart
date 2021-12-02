import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginFacebook extends StatelessWidget {
  const LoginFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade200,
      child: Center(
        child: ButtonWidget(textButton: 'login Facebook', ontap: () {}),
      ),
    );
  }
}

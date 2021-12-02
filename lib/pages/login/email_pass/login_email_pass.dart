import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:firebase_authentication/widgets/input_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginEmailPass extends StatelessWidget {
  LoginEmailPass({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputTextFieldWidget(
            controller: _controllerEmail,
            labelText: 'Email',
          ),
          InputTextFieldWidget(
            controller: _controllerPass,
            labelText: 'Password',
          ),
          ButtonWidget(textButton: 'Iniciar Sesion', ontap: () {}),
          ButtonWidget(textButton: 'Registrarse', ontap: () {}),
        ],
      ),
    );
  }
}

import 'package:firebase_authentication/widgets/input_text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPhone extends StatelessWidget {
  LoginPhone({Key? key}) : super(key: key);
  final TextEditingController _controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputTextFieldWidget(
            controller: _controllerPhone,
            labelText: 'Nro Celular',
            isNumber: true,
          ),
        ],
      ),
    );
  }
}

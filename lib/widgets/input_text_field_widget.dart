import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  const InputTextFieldWidget(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.isNumber = false})
      : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.red)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
        ),
        keyboardType:
            isNumber ? TextInputType.number : TextInputType.emailAddress,
        controller: controller,
      ),
    );
  }
}

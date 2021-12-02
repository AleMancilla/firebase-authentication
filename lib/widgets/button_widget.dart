import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String textButton;
  Function ontap;
  ButtonWidget({Key? key, required this.textButton, required this.ontap})
      : super(key: key);

  final BorderRadius _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: () {
            ontap();
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                textButton,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

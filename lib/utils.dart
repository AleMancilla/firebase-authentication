import 'package:flutter/material.dart';

void navigatorPushReplacement(BuildContext context, Widget route) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => route,
    ),
  );
}

void navigatorPush(BuildContext context, Widget route) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => route,
    ),
  );
}

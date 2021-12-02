import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LoginAnonimo extends StatelessWidget {
  const LoginAnonimo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade200,
      child: Center(
        child: ButtonWidget(
          textButton: 'login anonimo',
          ontap: () {
            loginFunction(context);
          },
        ),
      ),
    );
  }

  Future<void> loginFunction(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      if (userCredential.user?.uid != null) {
        navigatorPushReplacement(context, HomePage());
      } else {
        snackBarMessageError(context, 'Error al inicio de sesion');
      }
    } catch (e) {
      snackBarMessageError(context, 'Error: $e');
      print(' ===> Error: $e');
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils.dart';
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
          ButtonWidget(
              textButton: 'Iniciar Sesion', ontap: () => loginUser(context)),
          ButtonWidget(
              textButton: 'Registrarse', ontap: () => registerUser(context)),
        ],
      ),
    );
  }

  registerUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPass.text,
      );
      print(userCredential.user.toString());
      navigatorPushReplacement(context, HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackBarMessageError(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        snackBarMessageError(
            context, 'The account already exists for that email.');
      } else {
        snackBarMessageError(context, 'error: $e');
      }
    } catch (e) {
      snackBarMessageError(context, e.toString());
    }
  }

  loginUser(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPass.text,
      );
      navigatorPushReplacement(context, HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarMessageError(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        snackBarMessageError(context, 'Wrong password provided for that user.');
      }
    }
  }
}

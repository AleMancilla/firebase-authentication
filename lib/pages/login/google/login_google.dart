import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogle extends StatelessWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent.shade200,
      child: Center(
        child: ButtonWidget(
          textButton: 'login Google',
          ontap: () async {
            try {
              UserCredential userCredential = await signInWithGoogle();
              if (userCredential.user != null) {
                navigatorPush(context, HomePage());
              }
            } catch (e) {
              snackBarMessageError(context, 'ERROR DE AUTENTICACION $e');
            }
          },
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      return throw 'ERROR DE AUTENTICACION $e';
    }
  }
}

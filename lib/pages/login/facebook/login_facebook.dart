import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginFacebook extends StatelessWidget {
  const LoginFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade200,
      child: Center(
        child: ButtonWidget(
          textButton: 'login Facebook',
          ontap: () async {
            try {
              await signInWithFacebook();
              navigatorPushReplacement(context, HomePage());
            } catch (e) {
              print('#############################');
              print(e);
              print('#############################');
              snackBarMessageError(context, e.toString());
            }
          },
        ),
      ),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      print('----- status ${loginResult.status}');
      print('----- status ${loginResult.accessToken}');
      print('----- status ${loginResult.message}');

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      return throw 'ERROR = $e';
    }
  }
}

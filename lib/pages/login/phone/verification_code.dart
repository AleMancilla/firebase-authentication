import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:firebase_authentication/widgets/input_text_field_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VerificationCode extends StatelessWidget {
  final TextEditingController _controllerCodeVerification =
      TextEditingController();

  String verificationId;
  int? resendToken;

  VerificationCode(this.verificationId, this.resendToken, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lime.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputTextFieldWidget(
              controller: _controllerCodeVerification,
              labelText: 'codigo de verificacion',
              isNumber: true,
            ),
            ButtonWidget(
              textButton: 'Enviar codigo de verificacion',
              ontap: () async {
                try {
                  await loginPhoneMethod(context);
                } catch (e) {
                  print('Error = $e');
                  snackBarMessageError(context, 'Error = $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  loginPhoneMethod(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: _controllerCodeVerification.text);

      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      navigatorPushReplacement(context, HomePage());
    } catch (e) {
      throw e;
    }
  }
}

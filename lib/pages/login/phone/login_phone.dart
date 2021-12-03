import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/home_page.dart';
import 'package:firebase_authentication/pages/login/phone/verification_code.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
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
          ButtonWidget(
            textButton: 'Login phone',
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
    );
  }

  loginPhoneMethod(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+${_controllerPhone.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
          navigatorPushReplacement(context, HomePage());
        },
        verificationFailed: (FirebaseAuthException e) {
          snackBarMessageError(
              context, 'Error de verificacion, mas detalles = $e');
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code
          // String smsCode = 'xxxx';
          navigatorPush(context, VerificationCode(verificationId, resendToken));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      throw e;
    }
  }
}

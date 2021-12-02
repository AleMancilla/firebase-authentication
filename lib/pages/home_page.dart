import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/login_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  User? auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(),
          ButtonWidget(
              textButton: 'cerrar sesion',
              ontap: () async {
                await FirebaseAuth.instance.signOut();
                try {
                  final GoogleSignInAccount? googleUser =
                      await GoogleSignIn().signOut();
                } catch (e) {
                  print(e);
                }
                navigatorPushReplacement(context, const LoginPage());
              }),
          Text('Sesion Iniciada'),
          Text('displayName --- ${auth?.displayName}'),
          Text('email --- ${auth?.email}'),
          Text('emailVerified --- ${auth?.emailVerified}'),
          Text('isAnonymous --- ${auth?.isAnonymous}'),
          Text('metadata --- ${auth?.metadata}'),
          Text('phoneNumber --- ${auth?.phoneNumber}'),
          Text('photoURL --- ${auth?.photoURL}'),
          Text('providerData --- ${auth?.providerData}'),
          Text('refreshToken --- ${auth?.refreshToken}'),
          Text('tenantId --- ${auth?.tenantId}'),
          Text('uid --- ${auth?.uid}'),
          Text('hashCode --- ${auth?.hashCode}'),
          Text('runtimeType --- ${auth?.runtimeType}'),
        ],
      ),
    );
  }
}

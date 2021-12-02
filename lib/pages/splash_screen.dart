import 'login_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectPage();
  }

  void redirectPage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      //TODO: redireccionamiento a la pagina
      navigatorPushReplacement(context, const LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'SplashScreen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Divider(),
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 10,
            ),
          ),
        ],
      ),
    );
  }
}

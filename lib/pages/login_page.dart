import 'package:firebase_authentication/pages/login/anonimo/login_anonimo.dart';
import 'package:firebase_authentication/pages/login/email_pass/login_email_pass.dart';
import 'package:firebase_authentication/pages/login/facebook/login_facebook.dart';
import 'package:firebase_authentication/pages/login/google/login_google.dart';
import 'package:firebase_authentication/pages/login/phone/login_phone.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _indexPage,
          children: [
            const LoginAnonimo(),
            LoginEmailPass(),
            const LoginGoogle(),
            const LoginFacebook(),
            LoginPhone(),
          ],
        ),
        bottomNavigationBar: _bottomNavigatorBar(),
      ),
    );
  }

  Widget _bottomNavigatorBar() {
    return Container(
      height: 100,
      color: Colors.white,
      child: Wrap(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 20,

        children: [
          _iconButon('Anonimo', 0),
          _iconButon('Email/Pass', 1),
          _iconButon('Google', 2),
          _iconButon('Facebook', 3),
          _iconButon('Phone', 4),
        ],
      ),
    );
  }

  Widget _iconButon(String text, int index) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          _indexPage = index;
          setState(() {});
        },
        child: Ink(
          decoration: BoxDecoration(
            color:
                index == _indexPage ? Colors.blue.shade100 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
                color: index == _indexPage ? Colors.orange : Colors.grey),
          ),
          // child: Icon(
          //   icon,
          //   color: index == _indexPage ? Colors.orange : Colors.grey,
          // ),
        ),
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/splash_screen.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FirebaseAuthentication',
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return errorConectionFirebase();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return const SplashScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return loadingFirebase();
        },
      ),
    );
  }

  Widget errorConectionFirebase() {
    return const Scaffold(
      body: Center(
        child: Text('ERROR CONECTION FIREBASE'),
      ),
    );
  }

  Widget loadingFirebase() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

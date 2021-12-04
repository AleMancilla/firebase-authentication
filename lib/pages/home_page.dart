import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/login_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? auth = FirebaseAuth.instance.currentUser;

  late List<CameraDescription> cameras;
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    loadCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  loadCamera() async {
    cameras = await availableCameras();

    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(),
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
            },
          ),
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
          const Divider(),
          _camara(controller),
          ButtonWidget(
            textButton: 'Camara',
            ontap: () {
              controller = CameraController(cameras[0], ResolutionPreset.max);
              controller?.initialize().then((_) {
                if (!mounted) {
                  return;
                }
                setState(() {});
              });
            },
          )
        ],
      ),
    );
  }

  Widget _camara(CameraController? _controller) {
    try {
      return Container(
        width: 150,
        height: 150,
        child: CameraPreview(
          _controller!,
          child: Text('data'),
        ),
      );
    } catch (e) {
      return CircularProgressIndicator();
    }
  }
}

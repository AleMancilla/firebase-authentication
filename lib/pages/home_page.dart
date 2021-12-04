import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/pages/login_page.dart';
import 'package:firebase_authentication/utils.dart';
import 'package:firebase_authentication/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? auth = FirebaseAuth.instance.currentUser;

  File? imageFile;
  List<File>? listimageFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              _showSelectionDialog(context);
            },
            child: Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            heroTag: 'ads',
            onPressed: () {
              _showSelectionDialog(context, multiSelect: true);
            },
            child: Icon(Icons.camera),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            _setImageView(),
            _setImageViewList(),
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
          ],
        ),
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

  Future<void> _showSelectionDialog(BuildContext context,
      {bool multiSelect = false}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("From where do you want to take the photo?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        if (multiSelect) {
                          _openGalleryMultiSelect(context);
                        } else {
                          _openGallery(context);
                        }
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        if (multiSelect) {
                        } else {
                          _openCamera(context);
                        }
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Container(
        color: Colors.red,
        child: Image.file(imageFile!, width: 500, height: 500),
      );
    } else {
      return Text("Please select an image");
    }
  }

  Widget _setImageViewList() {
    if (listimageFile != null) {
      return Container(
        color: Colors.orange,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: listimageFile!
                .map(
                  (e) => Image.file(e, width: 500, height: 500),
                )
                .toList(),
          ),
        ),
      );
    } else {
      return Text("Please select an multiple image");
    }
  }

  final ImagePicker _picker = ImagePicker();

  void _openGallery(BuildContext context) async {
    var picture = await _picker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = File(picture!.path);
    });
    Navigator.of(context).pop();
  }

  void _openGalleryMultiSelect(BuildContext context) async {
    List<XFile>? listpicture = await _picker.pickMultiImage();
    this.setState(() {
      listimageFile = listpicture!.map((XFile pic) {
        return File(pic.path);
      }).toList();
    });
    Navigator.of(context).pop();
  }

  void _openCamera(BuildContext context) async {
    var picture = await _picker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = File(picture!.path);
    });
    Navigator.of(context).pop();
  }
}

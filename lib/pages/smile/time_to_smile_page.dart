import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/models/User.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';

class TimeToSmilePage extends StatefulWidget {
  @override
  _TimeToSmilePageState createState() => _TimeToSmilePageState();
}

class _TimeToSmilePageState extends State<TimeToSmilePage> {
  File _imageOfGallery;
  File _imageOfCamera;
  bool _inProcess = false;
  bool _blnGalleryImgValidator = false;
  bool _blnCameraImgValidator = false;

  Future getImagefromGallery() async {
    print('inside getimagefromgallery function');
    try {
      this.setState(() {
        _inProcess = true;
      });

      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        print('image is null');
        setState(() {
          _inProcess = false;
          _blnGalleryImgValidator = true;
        });
        return;
      }

      File cropped = await ImageCropper.cropImage(
            sourcePath: image.path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            // compressQuality: 100,
            // maxHeight: 100,
            // maxWidth: 100,
      );

      final imageTemporary = File(cropped.path);
      setState(() {
        this._imageOfGallery = imageTemporary;
        _inProcess = false;
        _blnGalleryImgValidator = false;
      });
      print(_imageOfGallery);
      // selectFilefromGallery();
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
    String fileName = _imageOfGallery.path.split('/').last;
    print('selected file is...');
    print(fileName);
  }

  Future getImagefromCamera() async {
    try {
      this.setState(() {
        _inProcess = true;
      });

      final image = await ImagePicker.pickImage(source: ImageSource.camera);
      if (image == null) {
        setState(() {
          _inProcess = false;
          _blnCameraImgValidator = true;
        });
        return;
      }

      File cropped = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        //compressQuality: 100,
        //maxHeight: 100,
        //maxWidth: 100,
      );

      final imageTemporary = File(cropped.path);
      setState(() {
        this._imageOfCamera = imageTemporary;
        _inProcess = false;
        _blnCameraImgValidator = false;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  String urlDownloadPhoto;
  String urlDownloadSelfie;

  Future uploadImageOfGallery() async {
    print('inside uploadimg function');
    if (_imageOfGallery == null) {
      _blnGalleryImgValidator = true;
      return;
    }
    String fileName = _imageOfGallery.path.split('/').last;
    final destination = 'users/user_register_photo/$fileName';
    UploadTask user = FirebaseApi.uploadFile(destination, _imageOfGallery);
    if (user == null) {
      return;
    }
    final snapshot = await user.whenComplete(() {});
    urlDownloadPhoto = await snapshot.ref.getDownloadURL();
    print('upload complete');
    print(urlDownloadPhoto);
  }

  Future uploadImageOfCamera() async {
    print('inside uploadimgofCamera function');
    if (_imageOfCamera == null) {
      print('image of camera is null case');
      _blnCameraImgValidator = true;
      return;
    }
    String fileName = _imageOfCamera.path.split('/').last;
    print(fileName);
    final destination = 'users/user_register_selfie/$fileName';
    UploadTask user = FirebaseApi.uploadFile(destination, _imageOfCamera);
    if (user == null) {
      return;
    }
    final snapshot = await user.whenComplete(() {});
    urlDownloadSelfie = await snapshot.ref.getDownloadURL();
    print('upload selfie complete');
    print(urlDownloadSelfie);

    //update DB
    updatePhotoVerficationData();

  }

  NearlyFinishedArgumentClass args;
  List<User> users;  User sessionUser;


  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments
    as NearlyFinishedArgumentClass;
    sessionUser = args.sessionUser;

    /*var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }*/
    //print(height);
    return Scaffold(
      body: Stack(
        children: [
          _buildContent(context),
          (_inProcess)? Container(
            //color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.95,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Center(
              child:CircularProgressIndicator(),
            )
          )
              : Container(),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildContent(context) {
    return SingleChildScrollView(
        child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      //color: Colors.amber,
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Time to smile',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50.0,
                    child: Container(
                      //color: Colors.grey[300],
                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      child: Container(
                        padding: EdgeInsetsDirectional.only(top: 7),
                        child: Text(
                          'We want musgreet to be free of fake accounts\n '
                              'Please upload and take a selfie which matches',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    /* _imageOfGallery == null
                  ?
                  : Image.file(_imageOfGallery),*/
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _imageOfGallery == null
                      ? Container()   : Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Image.file(
                      _imageOfGallery,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      getImagefromGallery();
                    },
                    color: Colors.blue[300],
                    textColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      size: 40,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        'Upload photo',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  (_blnGalleryImgValidator)?
                  Container(
                    child: Text(
                      'Please upload your photo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800]),
                    ),
                  )
                  : Container(),
                  SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      getImagefromCamera();
                    },
                    color: Colors.green[400],
                    textColor: Colors.white,
                    child: Icon(
                      Icons.camera_front,
                      size: 40,
                    ),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        "Let's take a selfie",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                  (_blnCameraImgValidator)?
                  Container(
                    child: Text(
                      'Please take your selfie',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800]),
                    ),
                  )
                      : Container(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    child: Text(
                      'You must take a clear photo of your face\n '
                          'No sunglasses please',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _imageOfCamera == null
                      ? Container()   : Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 20,
                    child: Image.file(
                      _imageOfCamera,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'This selfie is private and is only seen by our review team. '
                          'It is never made public or shown on your profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        onPressed: () {
                          processData();
                          //_navigateToNextScreen(context);
                        },
                      ),
                    ),
                  ),
                  // urlDownloadPhoto == null
                  //     ? Container()
                  //     : Image.network(urlDownloadPhoto),
                  // urlDownloadSelfie == null
                  //     ? Container()
                  //     : Image.network(urlDownloadSelfie),
                ],
              ),
          );
  }

  processData() {
    try {
      this.setState(() {
        _inProcess = true;
      });

      uploadImageOfGallery();
      uploadImageOfCamera();
      // Timer(Duration(seconds: 2),
      //         () => updatePhotoVerficationData());
    //       Timer(Duration(seconds: 1),
    // () => _navigateToNextScreen(context));

    this.setState(() {
      _inProcess = false;
    });

      // FutureBuilder<void>(
      //   future: queryPosts(),
      //   builder: (ctx, snapshot) {
      //     //List<Posts> PostsData = snapshot.data;
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.done:
      //         Postss = snapshot.data;
      //         return _buildUI(Postss,sessionUser);
      //       default:
      //         return _buildLoadingScreen();
      //     }
      //   },
      // );
    }catch(e) {

    }


    // uploadImageOfGallery();
    // uploadImageOfCamera();
    // updatePhotoVerficationData();
    // Timer(Duration(seconds: 2),
    //         () => _navigateToNextScreen(context));
  }

  Future<void> updatePhotoVerficationData() async {
    try {
      print('inside update function');
      print(urlDownloadPhoto);
      print(urlDownloadSelfie);
      if (sessionUser != null) {
        if(_imageOfGallery!=null && _imageOfCamera!=null){
          print(urlDownloadPhoto);
          print(urlDownloadSelfie);
          // final updatedItem = sessionUser.copyWith(
          //     photo_path: urlDownloadPhoto,
          //     selfie_path: urlDownloadSelfie,
          //     photo_verification: true
          // );
          // await Amplify.DataStore.save(updatedItem);
          // sessionUser = updatedItem;
          //
          // Navigation.intentWithData(
          //     context, AppRoutes.FINALSTEP, TimetoSmileArgumentClass(sessionUser));
        }
      }
    } catch (e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    if(_imageOfGallery!=null && _imageOfCamera!=null){
      Navigation.intentWithData(
          context, AppRoutes.FINALSTEP, TimetoSmileArgumentClass(sessionUser));
    }
  }
}

class FirebaseApi {
  static UploadTask uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }
}

class TimetoSmileArgumentClass {
  final User sessionUser;
  TimetoSmileArgumentClass(this.sessionUser);
}

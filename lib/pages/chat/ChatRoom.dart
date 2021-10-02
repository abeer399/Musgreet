import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ChatRoom extends StatelessWidget {

  void setmarks(String mark) async {
    await _firestore.collection('users').doc(_auth.currentUser.uid).update({
      "mark": mark,
    });
  }


  final Map<String, dynamic> userMap;
  final String chatRoomId;

  ChatRoom({@required this.chatRoomId, @required this.userMap});

  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  File imageFile;

  Future getImage() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": _auth.currentUser.displayName,
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile).catchError((error) async {
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .doc(fileName)
          .update({"message": imageUrl});

      print(imageUrl);
    }
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser.displayName,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp().toString(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Empty message");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: StreamBuilder<DocumentSnapshot>(
            stream:
                _firestore.collection("users").doc(userMap['uid']).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Row(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset(
                            "assets/group.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            userMap['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            snapshot.data['status'],
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Expanded(
                        child: InkWell(
                      child: Icon(
                        Icons.more_vert_sharp,
                        color: Colors.black,
                      ),
                    ))
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                height: size.height / 1.25,
                width: size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatroom')
                      .doc(chatRoomId)
                      .collection('chats')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> map = snapshot.data.docs[index]
                              .data() as Map<String, dynamic>;
                          return messages(size, map, context);
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                height: size.height / 10,
                width: size.width,
                alignment: Alignment.center,
                child: Container(
                  height: size.height / 12,
                  width: size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height / 17,
                        width: size.width / 1.3,
                        child: TextField(
                          controller: _message,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsetsDirectional.only(start: 15),
                              suffixIcon: IconButton(
                                onPressed: () => getImage(),
                                icon: Icon(Icons.photo),
                              ),
                              hintText: "Send Message",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(38),
                              )),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send), onPressed: onSendMessage),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return map['type'] == "text"
        ? Container(
            width: size.width,
            alignment: map['sendby'] == _auth.currentUser.displayName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green[300],
              ),
              child: Text(
                map['message'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          )
        : Container(
            height: size.height / 2.5,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            alignment: map['sendby'] == _auth.currentUser.displayName
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowImage(
                    imageUrl: map['message'],
                  ),
                ),
              ),
              child: Container(
                height: size.height / 2.5,
                width: size.width / 2,
                decoration: BoxDecoration(border: Border.all()),
                alignment: map['message'] != "" ? null : Alignment.center,
                child: map['message'] != ""
                    ? Image.network(
                        map['message'],
                        fit: BoxFit.cover,
                      )
                    : CircularProgressIndicator(),
              ),
            ),
          );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({@required this.imageUrl, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: Colors.black,
      child: Image.network(imageUrl),
    );
  }
}

/*
class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final int time = DateTime.now().minute;

  MessageTile({
    required this.message,
    required this.sendByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Column(
            children: [
              sendByMe
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: sendByMe ? 0 : 24,
                            right: sendByMe ? 24 : 0),
                        alignment: sendByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: sendByMe
                              ? EdgeInsets.only(left: 30)
                              : EdgeInsets.only(right: 30),
                          padding: EdgeInsets.only(
                              top: 17, bottom: 17, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: sendByMe
                                  ? BorderRadius.only(
                                  topLeft: Radius.circular(23),
                                  topRight: Radius.circular(23),
                                  bottomLeft: Radius.circular(23),
                                  bottomRight: Radius.circular(23))
                                  : BorderRadius.only(
                                  topLeft: Radius.circular(23),
                                  topRight: Radius.circular(23),
                                  bottomRight: Radius.circular(23),
                                  bottomLeft: Radius.circular(23)),
                              gradient: LinearGradient(
                                colors: sendByMe
                                ? [
                                Colors.green,
                                Colors.green,
                                ]
                                    : [
                                Colors.white,
                                Colors.white,
                                ],
                              )),
                          child: Container(
                            child: Column(
                              children: [
                                Text( message,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                SizedBox(
                                  height: 5,
                                ),
                                sendByMe?Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsetsDirectional.only(
                                      start: 50),
                                  child: Text(
                                    "$time min",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ):Container(
                                  alignment: Alignment.bottomRight,
                                  margin: EdgeInsetsDirectional.only(
                                      start: 50),
                                  child: Text(
                                    "$time min",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsetsDirectional.only(start: 150),
                        child: Container(
                          //margin: EdgeInsets.symmetric(vertical: 0,horizontal: 150),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 2),
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 2),
                                  top: BorderSide(
                                      color: Colors.grey, width: 2),
                                  left: BorderSide(
                                      color: Colors.grey, width: 2)),
                              borderRadius: BorderRadius.circular(50)),
                          height: 35,
                          width: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ),)
                    ],
                  ),
                ],
              )
                  : Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: sendByMe ? 0 : 24,
                        right: sendByMe ? 24 : 0),
                    alignment: sendByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: sendByMe
                          ? EdgeInsets.only(left: 30)
                          : EdgeInsets.only(right: 30),
                      */
/*  padding: EdgeInsets.only(
                                top: 17, bottom: 17, left: 20, right: 20)*/ /*

                      decoration: BoxDecoration(
                          borderRadius: sendByMe
                              ? BorderRadius.only(
                              topLeft: Radius.circular(23),
                              topRight: Radius.circular(23),
                              bottomLeft: Radius.circular(23),
                              bottomRight: Radius.circular(23))
                              : BorderRadius.only(
                              topLeft: Radius.circular(23),
                              topRight: Radius.circular(23),
                              bottomRight: Radius.circular(23),
                              bottomLeft: Radius.circular(23)),
                          gradient: LinearGradient(
                            colors: sendByMe
                            ? [
                            Colors.green,
                            Colors.green,
                            ]
                                : [
                            Colors.white,
                            Colors.white,
                            ],
                          )),
                      child: Container(
                        child: Column(
                          children: [
                            Text(message,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'OverpassRegular',
                                    fontWeight: FontWeight.w300)),

                            Container(
                              padding:
                              EdgeInsetsDirectional.only(end: 20),
                              margin:
                              EdgeInsetsDirectional.only(start: 50),
                              child: Text(
                                "$time min",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 60,
        )
      ],
    );
  }
}

*/

//

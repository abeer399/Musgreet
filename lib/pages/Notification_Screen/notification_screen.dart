/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final items = List<String>.generate(0, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Notification",
            style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              child: Container(
                padding: EdgeInsetsDirectional.only(end: 10, top: 25),
                child: Text(
                  "Mark all as read",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                      fontSize: 10),
                ),
              ),
            )
          ],
        ),
        body:ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(start: 15, top: 20),
              child: Text(
                "New",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/clothing.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 30, start: 5),
                          child: Text(
                            "Ahmed Mumtaz",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Avenir"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start:5),
                          child: Text(
                            "Request accepted",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      height: 40,
                      width: 85,
                      child: Card(
                          color: Colors.green[800],
                          child: Container(
                            padding:
                            EdgeInsetsDirectional.only(top: 10, start: 22),
                            child: Text(
                              "Friends",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/home.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 30, start: 5),
                          child: Text(
                            "Ahmed Mumtaz",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "Request Removed",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                     padding: EdgeInsetsDirectional.only(),
                      height: 40,
                      width: 85,
                      child: Card(
                          color: Colors.green[800],
                          child: Container(
                            padding:
                            EdgeInsetsDirectional.only(top: 10, start: 14),
                            child: Text(
                              "Add friends",
                              style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/homeu.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                              EdgeInsetsDirectional.only(top: 30, start: 5),
                              child: Text(
                                "Sofia Mumtaz",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                top: 30,
                              ),
                              child: Text(
                                "liked your page",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "Musgreetofficial",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "24m ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),

                    Container(
                        padding:
                        EdgeInsetsDirectional.only(bottom: 70, start: 40),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green[800],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/homeu.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                              EdgeInsetsDirectional.only(top: 30, start: 5),
                              child: Text(
                                "Sofia Mumtaz",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(
                                top: 30,
                              ),
                              child: Text(
                                "and 27 liked your page",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "Musgreetofficial",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "24m ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding:
                        EdgeInsetsDirectional.only(bottom: 75,start: 25 ),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green[800],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 15, top: 20),
              child: Text(
                "Older",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5, top: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/home.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 30, start: 5),
                          child: Text(
                            "Arsalan Ahmed just posted a video\nabout",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "Musgreet Community",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          child: Text(
                            "1d ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5, top: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/clothing.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 20, start: 5),
                          child: Text(
                            "Jamshed Khan posted in",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 3),
                          child: Text(
                            "Musgreet Community",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5,top: 3),
                          child: Text(
                            "'Community Guideline' ",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5 ,top: 3),
                          child: Text(
                            "1w ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(150)),
              padding: EdgeInsets.all(5),
              height: 120,
              child: Card(
                elevation: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 5, top: 15),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 40,
                        backgroundImage: AssetImage("assets/homeu.png"),
                        //backgroundColor: Colors.green[800],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                          EdgeInsetsDirectional.only(top: 30, start: 5),
                          child: Text(
                            "Sofia Khan commeted on your page",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsetsDirectional.only(start: 5,top: 5),
                              child: Text(
                                "Musgreet Community",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800]),
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.only(start: 5,top: 5),
                              child: Text(
                                "'Community Guideline' ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.only(start: 5 ,top: 5),
                          child: Text(
                            "1w ago",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 25,top: 15),
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    child: Text(
                      "You have reached end",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Anevir"),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 75,
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
            )
          ],
        )
      ),
    );
  }
}
*/

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/models/Notification.dart' as userNotification;
import 'package:mus_greet/pages/chat/HomeScreen.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:mus_greet/pages/stripe_screen/donation.dart';
import 'package:mus_greet/pages/stripe_screen/your_donation_data.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  //final items = List<String>.generate(0, (i) => "Item $i");
  //bool type = false;

  @override
  void initState() {
    setState((){
      queryNotification();
    });
    super.initState();
  }
  bool isloading = false;

  List<userNotification.Notification> notifications;

  Future<void>queryNotification() async {
    try {
      notifications = await Amplify.DataStore.query(
          userNotification.Notification.classType);
/*      print("notifications.length");
      print(notifications.length);
      print(notifications[0].message);
      print(notifications.length);*/
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
    setState(() {
      isloading = true;

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pop();},
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Notification",
            style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsetsDirectional.only(end: 10, top: 25),
                child: Text(
                  "Mark all as read",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Avenir",
                      fontSize: 10),
                ),
              ),
            )
          ],
        ),
        body: isloading== true ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: notifications.length,
                itemBuilder: (context, index){

                  if (notifications[index].type == "post" ) {
                    return Normalnotification(data: notifications[index]);
                  }
                   if (notifications[index].type == 'friend_request') {
                    return Requestaccepted(data: notifications[index]);
                  }
                   if (notifications[index].type == 'post_comment') {
                    return Requestremoved(data: notifications[index]);
                  }
                  else {
                    return CircularProgressIndicator();
                  }
                }):Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}

class Normalnotification extends StatelessWidget {
  var data;

  Normalnotification({this.data});
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
   //print("hello ${data.sent_datetime}");
   // print(DateFormat.yMd().format(data.sent_datetime));
   // print("hello ${DateTime.now().toIso8601String()}");
    //print(DateFormat.yMd().format(DateTime.now()));
    // print("Hello ${now == data.sent_date }");

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
      padding: EdgeInsets.all(5),
      height: 120,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
                backgroundImage: AssetImage("assets/homeu.png"),
                //backgroundColor: Colors.green[800],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 30, start: 5),
                      child: Text(
                        "Sofia Mumtaz",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsetsDirectional.only(
                        top: 30,
                      ),
                      child: Text(
                        data.message,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    "Musgreetofficial",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 0),
                  child: Text(
                    data.sent_date.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsetsDirectional.only(bottom: 75, start: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green[800],
                ))
          ],
        ),
      ),
    );
  }
}

class Requestremoved extends StatelessWidget {
  var data;

  Requestremoved({this.data});
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
      padding: EdgeInsets.all(5),
      height: 120,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40,
                backgroundImage: AssetImage("assets/home.png"),
                //backgroundColor: Colors.green[800],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(top: 30, start: 5),
                  child: Text(
                    "Ahmed Mumtaz",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 130,
                  padding: EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    data.message,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              margin: EdgeInsets.only(),
              height: 40,
              width: 85,
              child: Card(
                  color: Colors.green[800],
                  child: InkWell(
                    onTap: (){},
                      child:Center(
                        child: Text(
                          "Add friends",
                          style: TextStyle(
                              fontFamily: "Avenir",
                              fontSize: 10,
                              color: Colors.white),
                        ),
                      )),
            ),
            )
          ],
        ),
      ),
    );
  }
}

class Requestaccepted extends StatelessWidget {
  var data;

  Requestaccepted({this.data ,this.now});

  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),
      padding: EdgeInsets.all(5),
      height: 120,
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(start: 5),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/clothing.png"),
                backgroundColor: Colors.transparent,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(top: 30, start: 5),
                  child: Text(
                    "Ahmed Mumtaz",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                ),
                Container(
                  width: 140,
                  padding: EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    data.message,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 18,
            ),
            Container(
              height: 40,
              width: 85,
              child: Card(
                  color: Colors.green[800],
                  child: Center(
                    child: Text(
                      "Friends",
                      style: TextStyle(
                          fontFamily: "Avenir",
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

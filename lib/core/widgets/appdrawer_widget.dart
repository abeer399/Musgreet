import 'dart:ui';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/models/ModelProvider.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  final User loggedinuser;

  AppDrawer({key, this.child, this.loggedinuser}) : super(key: key);

  static _AppDrawerState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    print('checking');
    print(widget.loggedinuser);

    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(widget.loggedinuser),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  User loggeduser;

  CustomDrawer(this.loggeduser);

  List<User> UserObjectList = [];
  User UserObject;

  @override
  Widget build(BuildContext context) {

    //_getUser(loggeduser.id);
    print('inside custom drawer build');
    print(loggeduser);

    return FutureBuilder<User>(
      //future: _getUser(postData.usersID),
      future: _getUser(loggeduser.id),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            User UserData = snapshot.data;
            return _buildUI(UserData);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  /// This will render the waiting screen
  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  _buildUI(User UserData) {
    return Material(
      color: Colors.green[800],
      child: SafeArea(
        child: Theme(
            data: ThemeData(primaryColor: Colors.green[800]),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 105,
                      width: 85,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        child: Image.network(
                          //"assets/images/pets.png",
                          "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/home_user1.png",
                          fit: BoxFit.contain,),
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 26),
                          child:
                          //Text("Muhammad Hamza",
                          Text(UserData.first_name + " " + UserData.last_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: "Avenir",
                                color: Colors.white
                            ),),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Container(
                                height: 25,
                                width: 120,
                                color: Colors.white,
                                child: Container(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Text("Edit Profile",
                                    textAlign: TextAlign.center,
                                    style:
                                    TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: "Avenir",
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 25),
                      child: Text("My Local Area",style:
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: "Avenir",
                          color: Colors.white
                      ),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      child:
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/icon_mos.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Mosque",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/love_mos.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Mosque Following",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),

                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/bus.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Business",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),
                    GestureDetector(
                      child:Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/bus.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Business Favourites",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),

                    Container(
                      padding: EdgeInsetsDirectional.only(start: 25,top: 25),
                      child: Text('-  -  -  -  -  -  -  -  -  -  -  -  -  '
                          '-  -  -  -',style:
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "Avenir",
                          color: Colors.white
                      ),),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/sponser.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Sponsors & Advertisers",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child:
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/advertise.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Advertise with us",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/support.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Support us",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),
                    GestureDetector(
                      child:Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                "assets/icons/help.png",
                                fit: BoxFit.contain,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 13),
                              child: Text("Help & Support",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 7,
                    ),
                    GestureDetector(
                      child:
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsetsDirectional.only(top: 10),
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.settings_outlined,
                                  color: Colors.white,
                                  size: 35,
                                )
                            ),/*Image.asset(
                              "assets/images/mosque.png",
                              fit: BoxFit.contain,),
                          ),*/
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text("Settings",style:
                              TextStyle(
                                //fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: "Avenir",
                                  color: Colors.white
                              ),),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

   Future<User>_getUser(String usersID) async {
    print("User");
    print(usersID);
    try {
      UserObjectList = await Amplify.DataStore.query(User.classType ,where :User.ID.eq(usersID));
      print(UserObjectList[0].first_name);
      //print(UserObjectList.length);
      //print(UserObjectList[0].first_name);
      //await Future.delayed(Duration(seconds: 1));
      return UserObjectList[0];
      //UserObject = UserObjectList[0];
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }
}

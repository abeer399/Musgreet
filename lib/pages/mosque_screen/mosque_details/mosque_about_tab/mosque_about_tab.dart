import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:readmore/readmore.dart';
import 'package:amplify_flutter/amplify.dart';

import 'community_manager.dart';

class MosqueAboutTab extends StatefulWidget {
  final List<Mosque> mosque;
  User sessionUser;
  //FacilitiesTab(List<Mosque> mosque);
  MosqueAboutTab({this.mosque,this.sessionUser});

  @override
  _MosqueAboutTabState createState() => _MosqueAboutTabState();
}

class _MosqueAboutTabState extends State<MosqueAboutTab> {
  // var string=widget.mosque.id;
  String  verfied;
  List<MosqueUser> mosqueUsers;
  List<Mosque> mosque;
  bool mosqueAdmin=true;
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<MosqueUser>>(
      future: gettingUsers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            mosqueUsers = snapshot.data;
            return buildUI(mosqueUsers);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  buildUI(List<MosqueUser> mosqueUsers)
  {
    getAdminBool();
    aboutMosque();
    //gettingUsers();
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Text(
              AppTexts.ABOUT_TEXT,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30),
            child: ReadMoreText(
              widget.mosque[0].about,
              trimLines: 3,
              colorClickableText: Colors.green,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'read more',
              trimExpandedText: 'read less',
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black),
              moreStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 13,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.w300,
                  color: AppColors.green),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_NOT_VERIFIED,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 13),
                child: Text(
                  verfied,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.header_black),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_MAHAB,
                  width: 20,
                  height: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 12),
                    child: Text(
                      'Madhab ???Sect',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, left: 13),
                    child: Text(
                      widget.mosque[0].sect,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: FontConstants.FONT,
                          fontWeight: FontWeight.bold,
                          color: AppColors.GREY_KIND),
                    ),
                  ),
                ],
              ),
            ],
          ),
          mosqueAdmin?Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_COMMUNITY,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 13),
                child: Text(
                  'Community Managers',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              GestureDetector(
                onTap: () =>  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new CommunityManagerScreen(mosque : widget.mosque)),).then((value) => value?build(context):null),
                child: Padding(
                  padding: EdgeInsets.only(left: 100, top: 30),
                  child: AssetImageWidget(
                    image: ImageConstants.IC_EDIT,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ],
          )
          : Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30),
                child: Image.asset(
                  ImageConstants.IC_COMMUNITY,
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 13),
                child: Text(
                  'Community Managers',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              // GestureDetector(
              //   onTap: () =>  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new CommunityManagerScreen(mosque : widget.mosque)),).then((value) => value?build(context):null),
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 100, top: 30),
              //     child: AssetImageWidget(
              //       image: ImageConstants.IC_EDIT,
              //       height: 20,
              //       width: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
          _getFriendsDataList(),
        ],
      ),
    );
  }

  getAdminBool()
  {
    print("admin is true of not");
    print(widget.sessionUser.mosque_admin);
  }

  /// This will render all the friends list
  _getFriendsDataList1() {
    print(mosqueUsers.length);
    return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget> [
    Padding(padding: EdgeInsets.only(top: 10)),
    //_getFriendsDataListItem(),
    Padding(padding: EdgeInsets.only(top: 10)),
    //_getFriendsDataListItem(),
    //Padding(padding: EdgeInsets.only(top: 30)),
    ],
    ),
    );

  }

  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(
      double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
    );
  }

  /// This will render all the friends item
  _getFriendsDataListItem1() {
      return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
        getCommonPadding(
            68,
            6,
            0,
            12,
            Center(
              child: AssetImageWidget(
                image: ImageConstants.IC_FATHER,
                height: 35,
                width: 35,
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCommonPadding(
              0,
              6,
              0,
              27,
              Text("Hello",
                //mosqueUsers[index].name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),

            getCommonPadding(
              0,
              3,
              0,
              27,
              Text("Hi",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.GREY_KIND),
              ),
            ),
          ],
        ),
      ]);
  }
  Future<void> aboutMosque() async{

    try {
      //mosque = await Amplify.DataStore.query(Mosque.classType ,where :Mosque.ID.eq(string));
      if(widget.mosque[0].is_verified==true)
        {
          verfied ="Verified";
        }else{
        verfied ="Not Verified";
      }
      //print(mosque[0].house_number);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<List<MosqueUser>> gettingUsers() async{
    try {
      mosqueUsers = await Amplify.DataStore.query(MosqueUser.classType , where: MosqueUser.MOSQUE_ID.eq(widget.mosque[0].getId()));
      print("number of mosque Users");
      print(mosqueUsers);
      return mosqueUsers;
      //print(mosquePrayers[0].time);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  _getFriendsDataList() {
    print(mosqueUsers.length);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(padding: EdgeInsets.only(top: 10)),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:mosqueUsers.length,
              itemBuilder: (context,index){
                print(index);
                return  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      getCommonPadding(
                          68,
                          6,
                          0,
                          12,
                          Center(
                            child: AssetImageWidget(
                              image: ImageConstants.IC_FATHER,
                              //image:mosqueUsers[index].photo_path,
                              height: 35,
                              width: 35,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCommonPadding(
                            0,
                            6,
                            0,
                            27,
                            Text(
                              mosqueUsers[index].name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black),
                            ),
                          ),

                          getCommonPadding(
                            0,
                            3,
                            0,
                            27,
                            Text(
                              mosqueUsers[index].role,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.GREY_KIND),
                            ),
                          ),
                        ],
                      ),
                    ]);
              }
              )
          //Padding(padding: EdgeInsets.only(top: 10)),
          //_getFriendsDataListItem(),
          //Padding(padding: EdgeInsets.only(top: 30)),
        ],
      ),
    );

  }

}

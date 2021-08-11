import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:amplify_flutter/amplify.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/facility/facility.dart';





class FacilitiesTab extends StatefulWidget {
  final List<Mosque> mosque;
  final Users sessionUser;
  //FacilitiesTab(List<Mosque> mosque);
  FacilitiesTab({this.mosque,this.sessionUser});
  @override
  _FacilitiesTabState createState() => _FacilitiesTabState();
}

class _FacilitiesTabState extends State<FacilitiesTab> {

 // List<Mosque> mosque;
  List<String> idStringString;
  Map<String,String> SAMPLE={};
  List<Facilitiesmaster> facilities = [];
  List<String> facilitiesid=[];
  bool mosqueAdmin;


  @override
  Widget build(BuildContext context) {
    print(facilities);
    print(widget.mosque);
    print("inside the build");

    mosqueAdmin = widget.sessionUser.mosque_admin;

    return FutureBuilder<List<Facilitiesmaster>>(
      future: facility(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
              facilities = snapshot.data;
            return _buildUI(facilities);
          default:
            return _buildLoadingScreen();
        }
      },
    );
    //getList();
   // getMosque();

  }


  _buildUI(List<Facilitiesmaster> facilities)
  {
    _getList();
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: AppColors.white,
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 30),
            child: Text(
              AppTexts.FACILITIES_TEXT,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontConstants.FONT,
                  fontWeight: FontWeight.bold,
                  color: AppColors.header_black),
            ),
          ),
          mosqueAdmin?GestureDetector(
            onTap: () =>  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new FacilityScreen(mosque: widget.mosque ,facilities :facilitiesid)),).then((value) => value?build(context):null),
            child: Padding(
              padding: EdgeInsets.only(left: 310, top: 0),
              child: AssetImageWidget(
                image: ImageConstants.IC_EDIT,
                height: 20,
                width: 20,
              ),
            ),
          ) : Container(),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 5),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 6),
            itemCount: SAMPLE.length,
            itemBuilder: (BuildContext context, int index) {
              final title =SAMPLE.keys.elementAt(index);
              print(title);
              final image =SAMPLE.values.elementAt(index);
              print(image);
              //get your item data here ...
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 30),
                    child: Image.asset(
                      image,
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 12),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: FontConstants.FONT,
                            fontWeight: FontWeight.w600,
                            color: AppColors.header_black),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  _getList()
  {
    facilitiesid.clear();
    SAMPLE.clear();
    var a=widget.mosque[0].mosque_facility_list;
    print("mosque facility list");
    print(a);

    List<dynamic> mosqueFacilitiesList = [];
    if (a != null) {
      print('inside if');
      mosqueFacilitiesList = jsonDecode(a);

      print(mosqueFacilitiesList);
      var jsonDecodeMosqueList = mosqueFacilitiesList.join(",");
      var idStringString = (jsonDecodeMosqueList.split(','));
      print(idStringString);
      //idStringString=ab;
      for(int i=0;i<idStringString.length;i++) {
        print("inside the isString for loop");
        var selectedID=idStringString[i];
        for(int i=0;i<facilities.length;i++) {
          if (selectedID == facilities[i].id) {
            print("Adding the Facility");
            facilitiesid.add(facilities[i].facility_header);
            // SAMPLE = {
            //   for(int i = 0; i < idStringString.length; i++)
            //     facilities[i].facility_header: facilities[i].icon_path,
            //
            // };
            SAMPLE.addAll({
              facilities[i].facility_header: facilities[i].icon_path,
            });
          }
        }
      }
    } else {
      print('else part');
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
  Future<List<Facilitiesmaster>> facility() async
  {
    try {
      facilities = await Amplify.DataStore.query(Facilitiesmaster.classType);
      print("inside the facilitiy tab");
      print(facilities);
    return facilities;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

}
















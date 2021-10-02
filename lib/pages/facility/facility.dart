import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:amplify_flutter/amplify.dart';

class FacilityScreen extends StatefulWidget {
  final List<Mosque> mosque;
  final List<String> facilities;
  //final List<Users> genderFilteredUsers;
  //final List<Users> ageFilteredUsers;
  FacilityScreen({ this.mosque, this.facilities,
    //this.genderFilteredUsers,
    //this.ageFilteredUsers
  });
  @override
  _FacilityScreenState createState() => _FacilityScreenState();
}
class _FacilityScreenState extends State<FacilityScreen> {
  String languages;
  List<Facilities> facility;
  List<UserProfile> userProfile=[];
  List<String> _selectedItems = [];
  List<String> selectedId=[];
  List<String> _list=[];
  List<Mosque> mosque=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    masterFacilities();
    userDetails(widget.mosque[0]);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 15, right: 15, top: 60,bottom: 30),
            child: Column(
              children: [
                _getHeader(),
                CustomSpacerWidget(
                  height: 50,
                ),
                _getChipListOfReligions(),
                CustomSpacerWidget(
                  height: 150,
                ),
                _getAddAndCancelButton(),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 35,
            child: GestureDetector(
              onTap:() {
                Navigator.pop(context);
              },
              child: AssetImageWidget(
                image: ImageConstants.IC_BACK,
                height: 15,
                width: 25,
              ),
            ),

          ),
        ],
      ),
    );
  }

  _getHeader() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppTexts.SELECT_FACILITIES,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
            ),
          ),
          Text(
            AppTexts.CHOOSE_FACILITIES,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  _getChipListOfReligions() {
    return MultiSelectChip(
      AppTexts.FACILITIES_CATEGORIES,
      widget.facilities,
      onSelectionChanged: (val) {
        print("selecting the value");
        print(val);
        setState(() {
          _selectedItems.clear();
          _selectedItems.addAll(val);
        });
        print(_selectedItems);
      },
    );
  }

  _getAddAndCancelButton(){
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: (){
              print("Cancel");
              Navigator.pop(context);
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.ADD,
              isFilled: true,
              callBack: (){
                selectingTheFacilityId();
                print("Adding the facilities to the mosque ");
                updateMosque(widget.mosque ,_selectedItems);
                Navigator.pop(context,true);
              },
            ),
          ),
        ],
      ),
    );
  }


  updateMosque(List<Mosque> mosque, List<String> selectedItems)
  async {
    final updatedItem = mosque[0].copyWith(
        mosque_facilities_list:  jsonEncode(selectedId));
    await Amplify.DataStore.save(updatedItem);
  }

  selectingTheFacilityId()
  {
    selectedId.clear();
    for(int i=0;i<_selectedItems.length;i++)
      {
        var selectedItemName=_selectedItems[i];
        for(int i=0;i<facility.length;i++)
          {
            if(selectedItemName==facility[i].facility_header)
              {
                print("inside the if loop of facility");
                selectedId.add(facility[i].id);
                print(selectedId);
              }
          }
      }
  }

  Future<void> userDetails(Mosque sessionId) async{
    print("user id" +sessionId.id);
    //mosque = await Amplify.DataStore.query(UserProfile.classType , where: .USERSID.eq(widget.sessionUser.id));
    mosque = await Amplify.DataStore.query(Mosque.classType,where : Mosque.ID.eq(widget.mosque[0].id));
    print("print the languages");
  }

  Future<void> masterFacilities() async{
    //mosque = await Amplify.DataStore.query(UserProfile.classType , where: .USERSID.eq(widget.sessionUser.id));
    facility = await Amplify.DataStore.query(Facilities.classType);
    print("List of facility master" );

  }


}




class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final List<String> intrestData;
  final Function(List<String>) onSelectionChanged;
  final double width;
  final double fontSize;

  MultiSelectChip(this.reportList,this.intrestData, {this.onSelectionChanged,this.fontSize=12,this.width=1});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List.empty(growable: true);
  // List<String> selectedChoices=

  void initState()
  {
    selectedChoices.clear();
    print("inisde the init state");
    selectedChoices =widget.intrestData;
    print(widget.intrestData);
    print(selectedChoices);
  }


  _buildChoiceList() {
    List<Widget> choices = List.empty(growable: true);
    choices.clear();
    widget.reportList.forEach(
          (item) {
        choices.add(
          Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: ChoiceChip(
              padding: EdgeInsets.only(left: 5, right: 5),
              side: BorderSide(
                  width: widget.width,
                  color: selectedChoices.contains(item)
                      ? AppColors.background_color
                      : AppColors.background_color),
              label: Text(item),
              labelStyle: selectedChoices.contains(item)
                  ? TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: widget.fontSize,
                color: AppColors.white,
                fontWeight: FontWeight.w900,
              )
                  : TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: widget.fontSize,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500),
              selected: selectedChoices.contains(item),
              backgroundColor: selectedChoices.contains(item)
                  ? AppColors.background_color
                  : AppColors.white,
              selectedColor: AppColors.background_color,
              onSelected: (selected) {
                setState(() {
                  selectedChoices.contains(item)
                      ? selectedChoices.remove(item)
                      : selectedChoices.add(item);
                  widget.onSelectionChanged(selectedChoices); //+added
                });
              },
            ),
          ),
        );
      },
    );
    print(choices);
    print("List of choices");
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    //selectedChoices.add(widget.reportList.first);
    return Wrap(
      spacing: 10.0, // spacing between adjacent chips
      children: _buildChoiceList(),
    );
  }
}



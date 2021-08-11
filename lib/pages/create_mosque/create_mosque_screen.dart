import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/check_box_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/core/widgets/social_media_button_widget.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/login/login_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';

class CreateMosqueScreen extends StatefulWidget {
  final Users sessionUser;
  final bool isEdit;
  final Mosque mosqueObject;
  const CreateMosqueScreen({this.sessionUser, this.isEdit, this.mosqueObject});
  @override
  _CreateMosqueScreenState createState() => _CreateMosqueScreenState();
}

class _CreateMosqueScreenState extends State<CreateMosqueScreen> {
  final TextEditingController _mosqueNameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text: "+44 7785648214");
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _countryController = TextEditingController(text: "United Kingdom");
  final TextEditingController _contactDescriptionController = TextEditingController();
  final TextEditingController controller_house= TextEditingController();
  final TextEditingController controller_street= TextEditingController();
  final TextEditingController controller_city= TextEditingController();
  final TextEditingController controller_postcode= TextEditingController();
  final TextEditingController controller_country= TextEditingController();
  //List<Users> users = [];
  bool _isObscure = true;
  final _mosquenameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _urlKey = GlobalKey<FormState>();
  final _aboutKey = GlobalKey<FormState>();
  final _contactDescriptionKey = GlobalKey<FormState>();
  final _sectKey = GlobalKey<FormState>();
  final _houseKey = GlobalKey<FormState>();
  final _streetKey = GlobalKey<FormState>();
  final _cityKey = GlobalKey<FormState>();
  final _postcodeKey = GlobalKey<FormState>();
  final _countryKey = GlobalKey<FormState>();
  String mosqueSect = "";
  String mosquenameValidator;
  String emailValidator;
  String phoneValidator;
  String urlValidator;
  String aboutValidator;
  String contactDescriptionValidator;
  String sectValidator;
  String houseValidator;
  String streetValidator;
  String cityValidator;
  String postcodeValidator;
  String countryValidator;



  @override
  Widget build(BuildContext context) {
    print('build method');
    if(widget.isEdit == true){
      _mosqueNameController.text = widget.mosqueObject.mosque_name;
      _emailController.text = widget.mosqueObject.email;
      _phoneController.text = widget.mosqueObject.phone;
      _urlController.text = widget.mosqueObject.url;
      _aboutController.text = widget.mosqueObject.about;
      _contactDescriptionController.text = widget.mosqueObject.contact_description;
      mosqueSect = widget.mosqueObject.sect;
      controller_house.text = widget.mosqueObject.house_number;
      controller_street.text = widget.mosqueObject.street;
      controller_city.text = widget.mosqueObject.city;
      controller_postcode.text = widget.mosqueObject.postcode;

    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            _getLogoAndBack(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getCreateMosqueText(),
            CustomSpacerWidget(
              height: 15,
            ),
            ///Mosque Name
            Container(
              child: Form(
                key: _mosquenameKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getMosqueNameField(),
                  ],
                ),
              ),
            ),
            ///mosque Email
            Container(
              child: Form(
                key: _emailKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getEmailField(),
                  ],
                ),
              ),
            ),
            ///phone
            Container(
              child: Form(
                key: _phoneKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getPhoneField(),
                  ],
                ),
              ),
            ),
            ///URL
            Container(
              child: Form(
                key: _urlKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getURLField(),
                    //_getPhoneField(),
                  ],
                ),
              ),
            ),
            ///Sect
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 0, right: 0, bottom: 20, top: 20),
                child: Column(
                    children: [
                      Container(
                        child: Form(
                          key: _sectKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Container(
                                //padding: EdgeInsets.only(left: 5, right: 5),
                                child: DropDownTextField(
                                  fieldName: AppTexts.SECT,
                                  data: AppTexts.RELIGION_CATEGORIES,
                                  callBack: (val) {
                                    print(val);
                                    mosqueSect = val;
                                    print("selecting the value");
                                  },
                                ),
                              ),
                              //_getProfilePolicy(),
                            ],
                          ),
                        ),
                      ),
                    ]
                )
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   //padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   child: TextFormField(
            //     controller:_phoneController,
            //     keyboardType: TextInputType.name,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       prefixIcon: Row(
            //         children: [
            //           SizedBox(width: 15),
            //           new Container(
            //             width: 30,
            //             height: 20,
            //             decoration: new BoxDecoration(
            //                 color: Color(0xfff5f5f5)
            //             ),
            //             child: Image.asset(
            //               'assets/images/UK.png',
            //             ),
            //           ),
            //           SizedBox(width: 15),
            //           Text("+44 745 825 9546",
            //               style: TextStyle(
            //                 fontFamily: 'Avenir',
            //                 color: AppColors.GREY_KIND,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w900,
            //                 fontStyle: FontStyle.normal,
            //               )
            //           )
            //         ],
            //       ),
            //       labelText: 'Mobile number',
            //     ),
            //   ),
            // ),
            ///Mosque About
            Container(
              padding: EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.header_black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Form(
                key: _aboutKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getAboutTextSection(),
                  ],
                ),
              ),
            ),
            //_getAboutTextSection(),
            CustomSpacerWidget(
              height: 15,
            ),
            ///Mosque ContactDescription
            Container(
              padding: EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact Description",
                    style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.header_black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Form(
                key: _contactDescriptionKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getContactDescriptionTextSection(),
                  ],
                ),
              ),
            ),
           // _getContactDescriptionTextSection(),
            CustomSpacerWidget(
              height: 15,
            ),
            ///Address Feilds
            _getMosqueAddressText(),
            CustomSpacerWidget(
              height: 15,
            ),
            ///houseno
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              height: 60.0,
              child: TextFormField(
                controller: controller_house,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'House no',
                ),
              ),
            ),
            CustomSpacerWidget(
              height: 15,
            ),
            //SizedBox(height: SizeConfig.screenHeight * 0.01),
            ///Street
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_street,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Street',
                ),
              ),
            ),
            CustomSpacerWidget(
              height: 15,
            ),
            //SizedBox(height: SizeConfig.screenHeight * 0.01),
            ///City
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_city,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'City',
                ),
              ),
            ),
            CustomSpacerWidget(
              height: 15,
            ),
            //SizedBox(height: SizeConfig.screenHeight * 0.01),
            ///Post code
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_postcode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Postcode',
                ),
              ),
            ),
            CustomSpacerWidget(
              height: 6,
            ),
            ///Country
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   child: TextFormField(
            //     controller:_countryController,
            //     keyboardType: TextInputType.name,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       prefixIcon: Row(
            //         children: [
            //           SizedBox(width: 15),
            //           new Container(
            //             width: 30,
            //             height: 20,
            //             decoration: new BoxDecoration(
            //                 color: Color(0xfff5f5f5)
            //             ),
            //             child: Image.asset(
            //               'assets/images/UK.png',
            //             ),
            //           ),
            //           SizedBox(width: 15),
            //           Text("United kingdom",
            //               style: TextStyle(
            //                 fontFamily: 'Avenir',
            //                 color: AppColors.GREY_KIND,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w900,
            //                 fontStyle: FontStyle.normal,
            //               )
            //           )
            //         ],
            //       ),
            //       labelText: 'Country',
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: _countryController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Country',
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical:15),
            //     child: Text(
            //       'Country',
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //           fontSize: 14.0,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.grey),
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 30),
            //     child: Text(
            //       'United Kingdom',
            //       textAlign: TextAlign.left,
            //       style: TextStyle(
            //           fontSize: 14.0,
            //           fontWeight: FontWeight.normal,
            //           color: Colors.black87),
            //     ),
            //   ),
            // ),
            CustomSpacerWidget(
              height: 20,
            ),
            CustomSpacerWidget(height: 20,),
            //_getSaveButton(),
            _getAddAndCancelButton(),
            CustomSpacerWidget(
              height: 30,
            ),
            CustomSpacerWidget(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  _getLogoAndBack() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          child: AssetImageWidget(
            image: ImageConstants.IC_LOGIN_LOGO,
            height: 100,
            width: 100,
          ),
        ),
        Positioned(top: 40, left: 10, child: _getBackButton()),
      ],
    );
  }

  _getBackButton() {
    return GestureDetector(
      onTap: () {
        _navigateToMosqueDetailsScreen();
      },
      child: AssetImageWidget(
        image: ImageConstants.IC_BACK,
        height: 18,
        width: 18,
      ),
    );
  }

  _getCreateMosqueText() {
    return Container(
      height: 34,
      child: Text(
        "Create Mosque",
        style: TextStyle(
          fontSize: 23,
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.bold,
          color: AppColors.header_black,
        ),
      ),
    );
  }

  _getMosqueNameField() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _mosqueNameController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return mosquenameValidator;
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_MOSQUE,
                      //image: ImageConstants.IC_PROFILE,
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: 'Mosque Name',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getEmailField() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return emailValidator;
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_LOGIN_EMAIL,
                      height: 25,
                      width: 25,
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getPhoneField() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                return phoneValidator;
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: 'assets/images/UK.png',
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: '+44 7785648214',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getURLField() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              validator: (value) {
                return urlValidator;
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_TRAVEL_AND_TOURISM,
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: 'Mosque URL',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getAboutTextSection() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey)),
      height: 300,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CreatePostTextFieldWidget(
              controller: _aboutController,
              hintText: "Write about mosque here",
            ),
          ),

          //Here the rest Text will come if there,
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }

  _getContactDescriptionTextSection() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey)),
      height: 300,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CreatePostTextFieldWidget(
              controller: _contactDescriptionController,
              hintText: "Write Contact Description here",
            ),
          ),

          //Here the rest Text will come if there,
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }

  _getMosqueAddressText() {
    return Container(
      height: 34,
      child: Text(
        "Mosque Address",
        style: TextStyle(
          fontSize: 16,
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.bold,
          color: AppColors.header_black,
        ),
      ),
    );
  }

  _getSaveButton() {
    return LoginAndRegisterScreenButton(
      text: AppTexts.SAVE,
      isFilled: true,
      callBack: () {
        SaveMosque();
        // FutureBuilder(
        //     future: _registerUser(),
        //     builder: (context, snapshot) {
        //       return Text("You will not see this");
        //     });
        //Navigation.intentWithClearAllRoutes(context, AppRoutes.VERIFYEMAIL);
      },
    );
  }

  _getAddAndCancelButton() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: () {
              _navigateToMosqueDetailsScreen();
              //Navigation.back(context);
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.SAVE,
              isFilled: true,
              callBack: () {
                print('before calling save');
                print(widget.isEdit);
                if(widget.isEdit == true){
                  updateMosque();
                }
                else{
                  SaveMosque();
                }
                //Navigation.back(context);
                //print("Save");
              },
            ),
          ),
        ],
      ),
    );
  }

  _navigateToMosqueDetailsScreen(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MosquesDetailsScreen(sessionUser:widget.sessionUser,CallingScreen: "Create_Mosque")));
  }

  SaveMosques(){
    print("Inside save Mosques");
    print(_mosqueNameController.text);
    print(_emailController.text);
    print(_phoneController.text);
    print(_urlController.text);
    print(mosqueSect);
    print(_aboutController.text);
    print(_contactDescriptionController.text);
    print(controller_house.text);
    print(controller_street.text);
    print(controller_city.text);
    print(controller_postcode.text);
    print(_countryController.text);
    print(widget.sessionUser.id);

  }

  Future<void> SaveMosque() async{
    print("Inside save mosque to DB");
    try{
      final item = Mosque(
          mosque_name: _mosqueNameController.text,
          about: _aboutController.text,
          is_verified: true,
          sect: mosqueSect,
          mosque_photos_list: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/img_mosque.png",
          mosque_facility_list: null,
          contact_description: _contactDescriptionController.text,
          phone:_phoneController.text,
          email: _emailController.text,
          url:_urlController.text,
          house_number: controller_house.text,
          street: controller_street.text,
          city: controller_city.text,
          postcode: controller_postcode.text,
          country: "UK",
          //country: _countryController.text,
          mosque_admin_id: widget.sessionUser.id);
      await Amplify.DataStore.save(item);
      await Future.delayed(Duration(seconds: 3));
     _navigateToMosqueDetailsScreen();
    }catch(e){
      print("save mosque exeption: "+e);
    }
  }

  Future<void> updateMosque() async{
    try{
      print('inside update');
      print(widget.mosqueObject);

      print(_mosqueNameController.text);
      print(_emailController.text);
      print(_phoneController.text);
      print(_urlController.text);
      print(mosqueSect);
      print(_aboutController.text);
      print(_contactDescriptionController.text);
      print(controller_house.text);
      print(controller_street.text);
      print(controller_city.text);
      print(controller_postcode.text);
      print(_countryController.text);
      print(widget.sessionUser.id);

      final updatedItem = widget.mosqueObject.copyWith(
          mosque_name: _mosqueNameController.text,
          about: _aboutController.text,
          is_verified: true,
          sect: mosqueSect,
          mosque_photos_list: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/img_mosque.png",
          contact_description: _contactDescriptionController.text,
          phone:_phoneController.text,
          email: _emailController.text,
          url:_urlController.text,
          house_number: controller_house.text,
          street: controller_street.text,
          city: controller_city.text,
          postcode: controller_postcode.text,
          country: "UK",
          //country: _countryController.text,
          mosque_admin_id: widget.sessionUser.id);
      await Amplify.DataStore.save(updatedItem);
      await Future.delayed(Duration(seconds: 2));
      _navigateToMosqueDetailsScreen();
    }catch(e){
      print("exception in update mosque" +e);
    }
  }



}
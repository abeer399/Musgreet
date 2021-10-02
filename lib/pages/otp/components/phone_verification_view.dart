import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:mus_greet/core/utils/arguments.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/models/Post.dart';
import 'package:mus_greet/models/User.dart';
import 'package:mus_greet/pages/otp/components/phone_otp_view.dart';

//import 'package:musgreet/constants.dart';
//import 'package:musgreet/size_config.dart';
//import 'package:international_phone_input/international_phone_input.dart';
import 'package:mus_greet/pages/otp/phone_otp_screen.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/pages/verify_email_screen/verify_email_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

class PhoneVerificationView extends StatefulWidget {
  @override
  _PhoneVerificationViewState createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  //List<User> users;
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';

  //TextEditingController controller_phone = new TextEditingController(text: '7785648214');
  TextEditingController _phoneController = TextEditingController();
  String phoneValidator;
  final _phoneKey = GlobalKey<FormState>();
  VerifyEmailArgumentClass args;
  User sessionUser;

  //Post sessionUser;

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  String verificationId;
  bool showLoading = false;

  void signInWithAuth(fb.PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final _authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = true;
      });
      if (_authCredential.user != null) {
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }
    } on fb.FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
    }
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Inside build');
    args =
        ModalRoute.of(context).settings.arguments as VerifyEmailArgumentClass;
    sessionUser = args.sessionUser;
    print(sessionUser);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    print('inside getbody');
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: _phoneKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 15),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {},
                color: Colors.green[800],
                textColor: Colors.white,
                child: Icon(
                  Icons.phone_android,
                  size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              SizedBox(height: 25),
              Text(
                'Verify your number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                'We will send a one time password to\n your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              //Align(
              //alignment: Alignment.centerLeft,
              //child: Container(
              Container(
                //color: Colors.blue,
                //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Enter your phone number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.info_sharp,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ]),
              ),
              //),
              SizedBox(height: 5),
              Container(
                child: _getPhoneField(),
                // child: Form(
                //   key: _phoneKey,
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   child: Column(
                //     children: [
                //       _getPhoneField(),
                //     ],
                //   ),
                // ),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
              //           Container(
              //             width: 500,
              //             child: TextFormField(
              //               controller: _phoneController,
              //               keyboardType: TextInputType.emailAddress,
              //               validator: (value) {
              //                 return phoneValidator;
              //               },
              //               // validator: MultiValidator(
              //               //     [
              //               //       RequiredValidator(errorText: 'Email field is required'),
              //               //       EmailValidator(errorText: 'Please enter valid email'),
              //               //       loginValidator(
              //               //           errorText: "Email doesn't exist, please check",
              //               //           email: _emailController.text,
              //               //           pwd: _passwordController.text,
              //               //           fldEmail: true
              //               //       ),
              //               //     ]
              //               // ),
              //               decoration: InputDecoration(
              //                   border: new OutlineInputBorder(
              //                       borderRadius: const BorderRadius.all(
              //                         const Radius.circular(12.0),
              //                       ),
              //                       borderSide:
              //                       BorderSide(color: AppColors.green_light, width: 2.0)),
              //
              //                   //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
              //                   contentPadding: new EdgeInsets.symmetric(
              //                       vertical: 5.0, horizontal: 10.0),
              //
              //                   // prefixIcon: Padding(
              //                   //   padding: EdgeInsetsDirectional.only(
              //                   //       start: 10, end: 20, top: 0, bottom: 3),
              //                   //   child: AssetImageWidget(
              //                   //     image: ImageConstants.IC_LOGIN_EMAIL,
              //                   //     height: 25,
              //                   //     width: 25,
              //                   //   ),
              //                   // ),
              //
              //                   hintText: 'Please enter mobile number',
              //                   hintStyle: TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w900,
              //                     color: AppColors.light_grey,
              //                   )
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       labelText: 'Mobile number',
              //     ),
              //   ),
              // ),
              //InternationalPhoneInput(
              //decoration: InputDecoration(
              ////hintText: '(416) 123-4567',
              //enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // borderSide: BorderSide(color: Colors.grey),
              // ),
              //),
              //onPhoneNumberChange: onPhoneNumberChange,
              //initialPhoneNumber: phoneNumber,
              //initialSelection: '+44',
              //enabledCountries: ['+44'],
              //labelText: "Phone Number",
              //showCountryCodes: false,
              //),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                    child: Text(
                      'Send Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.green[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                    // onPressed: () async {
                    //   setState(() {
                    //     showLoading = false;
                    //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneOtpView()));
                    //     //Navigation.intentWithData(context, AppRoutes.VERIFYPHONE,PhoneVerificationArgumentClass(sessionUser));
                    //     //Navigation.push(context, AppRoutes.VERIFYPHONE);
                    //   });
                    //   await _auth.verifyPhoneNumber(
                    //       phoneNumber: '+447448479715', // controller_phone.text,
                    //       verificationCompleted: (phoneAuthCredential)async{
                    //         setState(() {
                    //           showLoading = false;
                    //         });
                    //       },
                    //       verificationFailed: (verificationFailed)async{
                    //         setState(() {
                    //           showLoading = false;
                    //         });
                    //
                    //       },
                    //       codeSent: (verificationId , resendingToken)async{
                    //         setState(() {
                    //           showLoading = false;
                    //           currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    //           this.verificationId = verificationId;
                    //           Navigation.intentWithData(context, AppRoutes.VERIFYPHONE,PhoneVerificationArgumentClass(sessionUser));
                    //         });
                    //       },
                    //       codeAutoRetrievalTimeout: (verificationId)async{
                    //       });
                    // }
                    onPressed: () {
                      sendCode();
                      // updatePhoneNumber();
                      // print(controller_phone.text);
                      // print("enter the phone number");
                      // Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                      //_navigateToNextScreen(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
                  contentPadding:
                      new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: 'assets/images/UK.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                  hintText: 'Phone number',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  void sendCode() async {
    String phoneErrorMessage = '';
    print('inside sendCode');
    try {
      if (_phoneController.text.trim().length == 0) {
        print('phone empty case');
        phoneErrorMessage = "Phone number is required";
      }
      else if (_phoneController.text.trim().length > 0) {
        print('phone number check case');
        bool phoneValid = RegExp(
                r'^(?:(?:\(?(?:0(?:0|11)\)?[\s-]?\(?|\+)44\)?[\s-]?(?:\(?0\)?[\s-]?)?)|(?:\(?0))(?:(?:\d{5}\)?[\s-]?\d{4,5})|(?:\d{4}\)?[\s-]?(?:\d{5}|\d{3}[\s-]?\d{3}))|(?:\d{3}\)?[\s-]?\d{3}[\s-]?\d{3,4})|(?:\d{2}\)?[\s-]?\d{4}[\s-]?\d{4}))(?:[\s-]?(?:x|ext\.?|\#)\d{3,4})?$')
            .hasMatch(_phoneController.text.trim());
        print(phoneValid);
        //print(_reTypePasswordController.text.trim());
        if (!phoneValid) {
          //invalid email case
          phoneErrorMessage = "Please provide valid phone number";
        } else {
          //phone number valid case
          print('phone number valid case');

          // String hello = "hello";
          // String hEllo = hello.substring(0, 1) + "E" + hello.substring(2);
          // print(hEllo); // prints hEllo

          String phone = _phoneController.text.trim();

          if (phone.substring(0, 1) == '0') {
            phone = '+44' + phone.substring(1);
          }

          await _auth.verifyPhoneNumber(
              phoneNumber: phone,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                  //phoneErrorMessage = "Oops..sending code failed, please try again.";
                });
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                  print('otp sent');
                  print(verificationId);
                  updatePhoneNumber();
                  Navigation.intentWithData(
                      context,
                      AppRoutes.VERIFYPHONE,
                      PhoneVerificationArgumentClass(
                          sessionUser, verificationId));
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {});
          return;
        }
      }

      print('before checking error msgs');
      print(phoneErrorMessage);
      if (phoneErrorMessage.length > 0) {
        setState(() {
          print('before setting state');
          phoneValidator = phoneErrorMessage;
          print(phoneValidator);
          //phoneErrorMessage = '';
        });
      } else {
        setState(() {
          phoneValidator = null;
        });
      }
    } catch (e) {
      print(e.message);
    }
  }

  void updatePhoneNumber() async {
    try {
      //if (sessionUser != null) {
      //   final updatedItem = sessionUser.copyWith(
      //       //phone: controller_phone.text);
      //       phone: "+44 745 825 9546");
      //   await Amplify.DataStore.save(updatedItem);
      //sessionUser = updatedItem;
      //}
    } catch (e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => PhoneOtpScreen()));
    //Navigation.intentWithData(context, AppRoutes.VERIFYPHONE,PhoneVerificationArgumentClass(sessionUser));
  }
}

class PhoneVerificationArgumentClass {
  final User sessionUser;
  final String verificationid;

  PhoneVerificationArgumentClass(this.sessionUser, this.verificationid);
}

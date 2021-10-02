//import 'dart:html';
import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_2_view.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_otp_screen.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_view.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/chat/ChatRoom.dart';
import 'package:mus_greet/pages/chat/HomeScreen.dart';
import 'package:mus_greet/pages/facility/facility.dart';
import 'package:mus_greet/pages/final/account_verification_success.dart';
import 'package:mus_greet/pages/final/community_promise_page.dart';
import 'package:mus_greet/pages/final/final_step_page.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/login/login_screen.dart';
import 'package:mus_greet/pages/otp/components/parent_email_verification_view.dart';
import 'package:mus_greet/pages/otp/components/phone_otp_view.dart';
import 'package:mus_greet/pages/otp/components/phone_verification_view.dart';
import 'package:mus_greet/pages/parent/parent_verification.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:mus_greet/pages/registration/registration_screen.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';
import 'package:mus_greet/pages/stripe_screen/donation_fee.dart';
import 'package:mus_greet/pages/stripe_screen/post_donation.dart';
import 'package:mus_greet/pages/stripe_screen/donation.dart';
import 'package:mus_greet/pages/stripe_screen/your_donation_data.dart';
import 'package:mus_greet/pages/verify_email_screen/verify_email_screen.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
import 'package:amplify_datastore/amplify_datastore.dart';
// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

import 'package:flutter/material.dart';
import 'package:mus_greet/pages/add_education_screen/add_education_screen.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_education_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_faith_interests_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_interests_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/find_mosque/search_mosque.dart';
import 'package:mus_greet/pages/friend_search/advance_search/friend_advance_search.dart';
import 'package:mus_greet/pages/friend_search/friend_search.dart';
import 'package:mus_greet/pages/interest_screen/add_skills_images.dart';
import 'package:mus_greet/pages/interest_screen/interest_screen.dart';
import 'package:mus_greet/pages/interest_screen/religious_interest_screen.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
import 'package:mus_greet/pages/mosque_screen/advance_search_screen/advance_search_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/pages/my_family_screen/my_family_screen.dart';
import 'package:mus_greet/pages/splash_screen/splash_screen.dart';
import 'core/utils/constants.dart';
import 'core/utils/routes.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosque_prayers/mosque_prayers_upload_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosque_about_tab/community_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'provider/mosque_donation_data.dart';
import 'provider/user_data_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MosqueDonationDataProvider>(
          create: (_) => MosqueDonationDataProvider()),
      ChangeNotifierProvider<UserDataProvider>(
          create: (_) => UserDataProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

///This is the root of our widget tree
class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    //if(_amplifyConfigured == false){
    try {
      await Future.wait([
        //Amplify.addPlugin(AmplifyAuthCognito());
        Amplify.addPlugin(
            AmplifyAPI()), // UNCOMMENT this line once backend is deployed
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance))
        //Amplify.addPlugin(AmplifyStorageS3());
      ]);

      // Once Plugins are added, configure Amplify
      await Amplify.configure(amplifyconfig);

      setState(() {
        print('Plugins configured successfully!');
        _amplifyConfigured = true;
      });

      //insertUsers();
      //listUsers();
      //createPosts();
      //queryPosts();
      //uploadFile();

      // try {
      //   String graphQLDocument =
      //   '''mutation CreateTodo(\$name: String!, \$description: String) {
      //           createTodo(input: {name: \$name, description: \$description}) {
      //             id
      //             name
      //             description
      //           }
      //     }''';
      //
      //   var variables = {
      //     "name": "my second todo",
      //     "description": "todo2 description",
      //   };
      //   var request = GraphQLRequest<String>(document: graphQLDocument, variables: variables);
      //
      //   var operation = Amplify.API.mutate(request: request);
      //   var response = await operation.response;
      //
      //   var data = response.data;
      //
      //   print('Mutation result: ' + data);
      //   //console.log('Mutation result: ' + data);
      //
      // } on ApiException catch (e) {
      //   print('Mutation failed: $e');
      // }

      //Listing todos

      //     try {
      //       String graphQLDocument = '''query ListTodos {
      //   listTodos {
      //     items {
      //       id
      //       name
      //       description
      //     }
      //     nextToken
      //   }
      // }''';
      //
      //       var operation = Amplify.API.query(
      //           request: GraphQLRequest<String>(
      //             document: graphQLDocument,
      //           ));
      //
      //       var response = await operation.response;
      //       var data = response.data;
      //
      //       print('Query result: ' + data);

    } catch (e) {
      print('Error in amplify configure');
      print(e);
    }
    //}
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      locale: Locale("en"),
      debugShowCheckedModeBanner: false,
      //home: MyDB(),

      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return somethingWentWrong();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MyDB();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return loading();
        },
      ),

      initialRoute: AppRoutes.SPLASH,
      //initialRoute: AppRoutes.AGEREGISTER,
      routes: _registerRoutes(),
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.SPLASH: (context) => SplashScreen(),
      //AppRoutes.HOME: (context) => Home(),
      AppRoutes.HOME: (context) => HomeScreen(),
      AppRoutes.ADD_SKILLS: (context) => AddSkillsScreen(),
      AppRoutes.ADD_EDUCATION: (context) => AddEducationScreen(),
      AppRoutes.MY_FAMILY: (context) => MyFamilyScreen(),
      AppRoutes.INTEREST_SCREEN: (context) => InterestScreen(),
      AppRoutes.MOSQUE_SEARCH_LIST_VIEW: (context) => MosqueSearchListView(),
      AppRoutes.MOSQUE_ADVANCE_SEARCH: (context) => AdvanceSearchScreen(),
      AppRoutes.FRIEND_ADVANCE_SEARCH: (context) => FriendAdvanceSearch(),
      AppRoutes.MOSQUE_DETAILS_SCREEN: (context) => MosquesDetailsScreen(),
      AppRoutes.MOSQUE_FROM_MAP: (context) => MosuqueSearchFromMap(),
      AppRoutes.CREATE_POST_SCREEN: (context) => CreatePostScreen(),
      AppRoutes.ADD_RELIGIOUS_INTERESTS_SCREEN: (context) =>
          ReligiousInterestScreen(),
      AppRoutes.SEARCH_EDUCATION_SCREEN: (context) => SearchEducationScreen(),
      AppRoutes.SEARCH_INTERESTS_SCREEN: (context) => SearchInterestsScreen(),
      AppRoutes.SEARCH_SKILLS_SCREEN: (context) => SearchSkillsScreen(),
      AppRoutes.SEARCH_FAITH_INTERESTS_SCREEN: (context) =>
          SearchFaithInterestsScreen(),
      AppRoutes.LANGUAGES_SCREEN: (context) => LanguagesScreen(),
      AppRoutes.ADD_SKILLS_IMAGES: (context) => AddSkillsImagesScreen(),
      AppRoutes.FRIEND_SEARCH: (context) => FriendSearch(),
      AppRoutes.VIEW_PROFILE_SCREEN: (context) => ViewProfileScreen(),
      AppRoutes.REGISTER: (context) => RegistrationScreen(),
      AppRoutes.VERIFYEMAIL: (context) => VerifyEmailScreen(),
      AppRoutes.PHONEINPUT: (context) => PhoneVerificationView(),
      AppRoutes.VERIFYPHONE: (context) => PhoneOtpView(),
      AppRoutes.AGEREGISTER: (context) => AgeRegistrationPage(),
      AppRoutes.PARENTEMAIL: (context) => ParentVerificationPage(),
      AppRoutes.VERIFYADDRESS: (context) => AddressVerificationView(),
      AppRoutes.PARENTVERIFYEMAIL: (context) => ParentEmailVerificationView(),
      AppRoutes.NEARLYFINISHED: (context) => NearlyFinishedPage(),
      AppRoutes.TIMETOSMILE: (context) => TimeToSmilePage(),
      AppRoutes.FINALSTEP: (context) => FinalStepPage(),
      AppRoutes.ACCOUNTSUCCESS: (context) => AccountVerificationSuccessPage(),
      AppRoutes.COMMUNITYPROMISE: (context) => CommunityPromisePage(),
      AppRoutes.MANUALADDRESS1: (context) => ConfirmAddressView(),
      AppRoutes.MANUALADDRESS2: (context) => ConfirmAddress2View(),
      AppRoutes.MANUALADDRESSOTP: (context) => VerifyAddressOTPScreen(),
      AppRoutes.LOGIN: (context) => LoginScreen(),
      AppRoutes.MOSQUE_PRAYERS_UPLOAD_SCREEN: (context) =>
          MosquePrayersUploadScreen(),
      AppRoutes.FACILITIES: (context) => FacilityScreen(),
      AppRoutes.COMMUNITY_MANAGER: (context) => CommunityManagerScreen(),
      AppRoutes.CHAT: (context) => ChatHomeScreen(),
      AppRoutes.CHAT2: (context) => ChatRoom(),
      AppRoutes.STRIPE: (context) => PostDonation(),
      AppRoutes.STRIPE2: (context) => DonationFee(),
      AppRoutes.STRIPE3: (context) => DonationFee(),
      AppRoutes.STRIPE4: (context) => YourDonation(),
      AppRoutes.STRIPE5: (context) => DonationScreen(),
    };
  }

  Widget somethingWentWrong() {
    return Scaffold(
      body: Center(
        child: Text("Oops...looks like there is some issue"),
      ),
    );
  }

  Widget loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyDB extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _MyDBState createState() => _MyDBState();
}

class _MyDBState extends State<MyDB> {
  List<User> Userss;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //clear local datastore and create master data for the very first time i.e. app installation

    return Container();
  }
}

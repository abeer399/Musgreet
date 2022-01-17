import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/mosque_advance_search.dart';
import 'package:mus_greet/core/widgets/search_text_field_widget.dart';
import 'package:mus_greet/models/Mosque.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mus_greet/pages/find_mosque/masjidData_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MosuqueSearchFromMap extends StatefulWidget {
  @override
  _MosuqueSearchFromMapState createState() => _MosuqueSearchFromMapState();
}

var data;

class _MosuqueSearchFromMapState extends State<MosuqueSearchFromMap> {
// Object for PolylinePoints
  PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

// Create the polylines for showing the route between two places

  bool isDistanceCalculated = false;
  double distanceInMeters = 0.0;

  _findDistance(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    //! Distance Function
    print("// ignore: await_only_futures");
    print(startLatitude);
    print(startLongitude);
    print(destinationLatitude);
    print(destinationLongitude);
    // ignore: await_only_futures
    distanceInMeters = await Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      destinationLatitude,
      destinationLongitude,
    );
    print(distanceInMeters);
    setState(() {
      distanceInMeters = distanceInMeters;
      isDistanceCalculated = true;
    });
    return distanceInMeters;
  }

  void checkingPoints(result) {
    setState(() {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      // Defining an ID
      PolylineId id = PolylineId('poly');

      // Initializing Polyline
      Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 3,
      );

      // Adding the polyline to the map
      polylines[id] = polyline;
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.5074238, -0.144691),
    zoom: 9.0,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(24.954206649820694, 67.0580167632622),
      tilt: 59.440717697143555,
      zoom: 17.151926040649414);

  List<Marker> allMarkers = [];
  List<String> convertedDistance = [];
  @override
  void initState() {
    readJson();
    super.initState();
  }

  bool isloading = true;

  // Fetch content from the json file
  Future<List<MasjidData>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/masjidData.json');
    data = masjidDataFromJson(response);
    print(data[0].name);
    // setCustomMarker();
    addMarkers();
    return data;
  }

  // BitmapDescriptor customMarker;

  // void setCustomMarker() async {
  //   BitmapDescriptor customMarker = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), "assets/images/noun_mosque.png");
  // }

  Future<void> addMarkers() async {
    BitmapDescriptor customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/noun_mosque.png");

    Position currentPosition = await _determinePosition();
    int dataCount = data.length;
    for (int a = 0; dataCount > a; a++) {
      allMarkers.add(
        Marker(
          markerId: MarkerId(data[a].name),
          draggable: false,
          icon: customMarker,
          onTap: () {
            print(data.name);
          },
          position: LatLng(
            double.parse(
              data[a].longtitude,
            ),
            double.parse(
              data[a].latitude,
            ),
          ),
        ),
      );

      double result = await _findDistance(
        currentPosition.latitude,
        currentPosition.longitude,
        double.parse(data[a].longtitude),
        double.parse(data[a].latitude),
      );
      convertedDistance.add((result / 1609).toStringAsFixed(3));
    }
    setState(() {
      isloading = false;
    });
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  void locatePosition() async {
    Position currentPosition = await _determinePosition();
    LatLng latLagPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLagPosition, zoom: 19.0);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  List<Mosque> Mosques = [];
  @override
  Widget build(BuildContext context) {
    listMosque();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(context),
        body: _getBody(),
      ),
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 150),
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _getRowHeader(),
                CustomSpacerWidget(
                  height: 15,
                ),
                _getSearchTextField(),
                CustomSpacerWidget(
                  height: 10,
                ),
                _getAdvanceSearchField(),
              ],
            )),
      ),
    );
  }

  _getRowHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () => Navigation.back(context),
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 18,
            width: 25,
          ),
        ),
        Container(
          child: Text(
            AppTexts.SEARCH,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        Container(
          height: 20,
          width: 20,
          child: GestureDetector(
            onTap: () => Navigation.back(context),
            child: Image.asset(
              ImageConstants.IC_NON_BULLET,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  _getSearchTextField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.green,
        ),
      ),
      child: TextField(
        //controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
          //hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.black_50,
          ),
          labelText: AppTexts.LABEL_CURRENT_LOCATION,
          labelStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
          hintText: AppTexts.HINT_LOCATION,
          prefixIcon: GestureDetector(
            onTap: locatePosition,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                ImageConstants.IC_CURRENT_LOCATION,
                height: 20,
                width: 20,
              ),
            ),
          ),
          suffixIcon: Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green),
              color: AppColors.background_color,
            ),
            margin: EdgeInsets.only(top: 2, right: 4, bottom: 2, left: 4),
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.IC_SEARCH,
              height: 20,
              width: 20,
            ),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 20, bottom: 10, top: 10, right: 20),
        ),
      ),
    );
  }

  _getAdvanceSearchField() {
    return AdvanceSearchWidgetMosque(
        callBack: () => _navigateToAdvanceSearchScreen());
  }

  _getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      //padding: EdgeInsets.only(top: 20,left: 15,right: 15),
      color: AppColors.white_shade,
      child: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            polylines: Set<Polyline>.of(polylines.values),
            markers: Set.from(allMarkers),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 10,
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: allMarkers.length,
                  itemBuilder: (context, index) {
                    return _getMosques(index);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _getMosques(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        ConstrainedBox(
          constraints: BoxConstraints.expand(width: 250, height: 200),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstants.IC_BG_MOSQUE_SEARCH),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(children: [
                _getRemoveButton(),
                Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.only(
                        left: 22, right: 22, bottom: 10, top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomSpacerWidget(
                          height: 10,
                        ),
                        Flexible(
                          child: _getNameOfMosque(index),
                        ),
                        CustomSpacerWidget(
                          height: 5,
                        ),
                        _getMosqueLocation(index),
                        _getMosqueReligion(index),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              ImageConstants.IMG_POST1,
              fit: BoxFit.cover,
              height: 95,
              width: 85,
            ),
          ),
        ),
      ]),
    );
  }

  _getNameOfMosque(int index) {
    return Text(
      data[index].name,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
    );
  }

  _getMosqueLocation(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetImageWidget(
          image: ImageConstants.TEMP_LOCATION,
          height: 13,
          width: 13,
          color: AppColors.vertical_divider,
        ),
        CustomSpacerWidget(
          width: 4,
        ),
        Container(
          width: 180,
          child: Text(
            data[index].address,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.vertical_divider,
            ),
          ),
        )
      ],
    );
  }

  _getRemoveButton() {
    return Positioned(
      right: 15,
      top: 50,
      child: MosqueFollowButton(
        radius: 30,
        callBack: () {
          print("Handle CallBack");
        },
        text: AppTexts.FOLLOW_TEXT,
        isFilled: false,
      ),
    );
  }

  _getMosqueReligion(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 13,
          width: 13,
        ),
        CustomSpacerWidget(
          width: 4,
        ),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: convertedDistance[index] == null
                ? Text("")
                : Text(
                    "${data[index].madhabSect} . ${convertedDistance[index]} mi",
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: FontConstants.FONT,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.vertical_divider,
                    ),
                  ),
          ),
        ),
        // CustomSpacerWidget(
        //   width: 4,
        // ),
        // Text(
        //   ".",
        //   overflow: TextOverflow.clip,
        //   maxLines: 1,
        //   style: TextStyle(
        //     fontFamily: FontConstants.FONT,
        //     fontSize: 11,
        //     fontWeight: FontWeight.w900,
        //     color: AppColors.vertical_divider,
        //   ),
        // ),
        // CustomSpacerWidget(
        //   width: 4,
        // ),
        // convertedDistance[index] == null
        //     ? Text("")
        //     : Text(
        //         convertedDistance[index],
        //         overflow: TextOverflow.clip,
        //         maxLines: 1,
        //         style: TextStyle(
        //           fontFamily: FontConstants.FONT,
        //           fontSize: 11,
        //           fontWeight: FontWeight.w600,
        //           color: AppColors.vertical_divider,
        //         ),
        //       ),
        // Expanded(
        //   child: CustomSpacerWidget(
        //     width: 4,
        //   ),
        // ),
      ],
    );
  }

  _navigateToAdvanceSearchScreen() {
    Navigation.intent(context, AppRoutes.MOSQUE_ADVANCE_SEARCH);
  }

  Future<void> listMosque() async {
    try {
      Mosques = await Amplify.DataStore.query(Mosque.classType);
      print(Mosques);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }
}



import 'dart:typed_data';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Utilities/SizeConfig.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:mus_greet/models/MosquePrayers.dart';
import 'package:mus_greet/models/Users.dart';
//import 'dart:html';
import 'dart:io';
//import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:intl/intl.dart';

import '../mosques_detail_screen.dart';

class MosquePrayersUploadScreen extends StatefulWidget {
  final List<Mosque> mosque;
  final Users sessionUser;
  MosquePrayersUploadScreen({this.mosque, this.sessionUser});

  @override
  _MosquePrayersUploadScreenState createState() => _MosquePrayersUploadScreenState();
}

class _MosquePrayersUploadScreenState extends State<MosquePrayersUploadScreen> {
  final List<Widget> fieldList = List.empty(growable: true);

  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType;
  String _filePath;

  List<Mosque> mosque=[];
  List<MosquePrayers> mosquePrayers=[];

  String mosqueID;

  @override
  Widget build(BuildContext context) {
print('in mosque prayers upload build');
    mosqueID = widget.mosque[0].id;  // '6661a72d-445d-42ba-b151-7928aa054826';
    print(mosqueID);
    print(mosque);

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
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
        child: Column(
          children: [
            _getHeaderAndBack(),
            CustomSpacerWidget(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppTexts.UPLOAD_MOSQUE_PRAYERS_TEXT,
                //textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
            CustomSpacerWidget(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child:  RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    'Please choose your excel file',
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
                  onPressed: () {
                    getFilePath();
                    //_openFileExplorer();
                    // updateUserDetails();
                    // Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                    //_navigateToNextScreen(context);
                  },
                ),

              ),
            ),
            CustomSpacerWidget(
              height: 10,
            ),
            new Builder(
              builder: (BuildContext context) => _loadingPath
                  ? Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: const CircularProgressIndicator())
                  : _path != null || _paths != null
                  ? new Container(
                padding: const EdgeInsets.only(bottom: 30.0),
                height: MediaQuery.of(context).size.height * 0.50,
                child: new Scrollbar(
                    child: new ListView.separated(
                      itemCount: _paths != null && _paths.isNotEmpty
                          ? _paths.length
                          : 1,
                      itemBuilder: (BuildContext context, int index) {
                        final bool isMultiPath =
                            _paths != null && _paths.isNotEmpty;
                        final String name = 'File $index: ' +
                            (isMultiPath
                                ? _paths.keys.toList()[index]
                                : _fileName ?? '...');
                        final path = isMultiPath
                            ? _paths.values.toList()[index].toString()
                            : _path;

                        return new ListTile(
                          title: new Text(
                            //name,
                            _fileName,
                            //_path,
                          ),
                          subtitle: new Text(path),
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) =>
                      new Divider(),
                    )),
              )
                  : new Container(),
            ),

            _getUploadAndCancelButton(),
          ],
        ),
      ),
    );
  }


  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType);
          //type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath();
          //type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      print('picked file:');
      print(_path);
      print(_paths);
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

  void _navigateToMosqueDetailsScreen() async{

    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MosquesDetailsScreen(sessionUser:widget.sessionUser,CallingScreen: "Create_Mosque")));
  }

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath();
      if (filePath == '') {
        return;
      }
      print("File path: " + filePath);
      setState(() {
        this._path = filePath;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });

    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  void backup() async {
    //final file = getSomeCorrectFile(); // File
    // final bytes = await file.readAsBytes(); // Uint8List
    // final byteData = bytes.buffer.asByteData(); // ByteData

    //final bytes = await File(_path).readAsBytes(); // Uint8List
    //final byteData = bytes.buffer.asByteData(); // ByteData
    //var bytes2 = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    //var excel = Excel.decodeBytes(bytes, update: true);
    //ByteData bytes2 = await File(_path).readAsBytes().then((data) => ByteData.view(data as ByteBuffer));
    // Uint8List bytes2 = Uint8List.fromList(File(_path).readAsBytesSync());
    // var excel = Excel.decodeBytes(bytes2);



    //var file = "Path_to_pre_existing_Excel_File/excel_file.xlsx";
    // var bytes = File(_path).readAsBytesSync();
    // var excel = Excel.decodeBytes(bytes);



    // ByteData data = await rootBundle.load("assets/test.xlsx");
    // var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // //var excel = Excel.decodeBytes(bytes, update: true);
    // var excel = Excel.decodeBytes(bytes);

    //Sheet sheetObject = excel['July'];

    //var excelfileDetails = new MyExcelTable();

    // excelfileDetails.name = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:0,rowIndex: rowIndex)).value.toString();
    // excelfileDetails.age = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:1,rowIndex: rowIndex)).value;
    // excelfileDetails.state = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:2,rowIndex: rowIndex)).value.toString();
    // excelfileDetails.country = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:3,rowIndex: rowIndex)).value.toString();
    // excelfileDetails.occupation = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:4,rowIndex: rowIndex)).value.toString();

    //excelList.add(excelfileDetails);
  }

  Future<void> createMosque() async {
    try{
      mosque=await Amplify.DataStore.query(Mosque.classType);
      print(mosque.length);
      print(mosque);
      // List<String> facilityUserList=[facilities[0].id,facilities[1].id,facilities[2].id,facilities[3].id,facilities[4].id];
      // List<String>  facilityUserList1=[facilities[0].getId()  + "," + facilities[3].getId()+ "," + facilities[4].getId()+ "," + facilities[5].getId()+ "," + facilities[6].getId()];
      // List<String>  facilityUserList2=[facilities[0].getId()  + "," + facilities[2].getId() + "," + facilities[3].getId() + "," + facilities[4].getId() + "," + facilities[5].getId()];
      // print(userProfile);
      if(mosque.isEmpty)
      {
        final item = Mosque(
            mosque_name: "Lewish Islamic Center",
            about: "Lorem ipsum dolor sit amet",
            is_verified: true,
            sect: "Sunni",
            mosque_photos_list:"https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/img_mosque.png",
            //mosque_facility_list: jsonEncode(facilityUserList),
            contact_description: "Lorem ipsum dolor sit amet",
            phone: "020 8690 5090",
            email: "info@lewisham.com.uk",
            url: "www.lewish.com.uk",
            house_number: "363-365 ",
            street: "Lewisham High Street",
            city: "Luton",
            postcode: "SE13 6N",
            country: "Uk");
        await Amplify.DataStore.save(item);

        print("Mosque Created");
      }
      // createUserProfile();
    } catch(e)
    {
      print(e);
    }

  }

  Future<void> createMosquePrayers() async {
    try{
      TemporalDate date=new TemporalDate(DateTime.now());

      mosquePrayers=await Amplify.DataStore.query(MosquePrayers.classType);
      //await Amplify.DataStore.delete(mosquePrayers[0]);
      print(mosquePrayers.length);
      print(mosquePrayers);
      if(mosquePrayers.isEmpty) {
        final Day1Prayer1 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "Fajir",
            Date: date,
            end_time: TemporalTime.fromString("08:44"),
            begin_time: TemporalTime.fromString("08:14"));
        await Amplify.DataStore.save(Day1Prayer1);

        final Day1Prayer2 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "DHUMAR",
            Date: date,
            end_time: TemporalTime.fromString("13:15"),
            begin_time: TemporalTime.fromString("13:00"));
        await Amplify.DataStore.save(Day1Prayer2);

        final Day1Prayer3 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "ASR",
            Date: date,
            end_time: TemporalTime.fromString("12:30"),
            begin_time: TemporalTime.fromString("12:14"));
        await Amplify.DataStore.save(Day1Prayer3);

        final Day1Prayer4 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "MAGHRIB",
            Date: date,
            end_time: TemporalTime.fromString("16:29"),
            begin_time: TemporalTime.fromString("16:14"));
        await Amplify.DataStore.save(Day1Prayer4);

        final Day1Prayer5 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "JUMMAH",
            Date: date,
            end_time: TemporalTime.fromString("18:30"),
            begin_time: TemporalTime.fromString("18:14"));
        await Amplify.DataStore.save(Day1Prayer5);


        final Day1Prayer6 = MosquePrayers(
            mosqueID: mosque[0].getId(),
            prayer: "ISHA",
            Date: date,
            end_time: TemporalTime.fromString("20:30"),
            begin_time: TemporalTime.fromString("20:14"));
        await Amplify.DataStore.save(Day1Prayer6);

        // final Day2Prayer1 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "Fajir",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("08:44"),
        //     begin_time: TemporalTime.fromString("08:14"));
        // await Amplify.DataStore.save(Day2Prayer1);
        //
        // final Day2Prayer2 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "DHUMAR",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("13:15"),
        //     begin_time: TemporalTime.fromString("13:00"));
        // await Amplify.DataStore.save(Day2Prayer2);
        //
        // final Day2Prayer3 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "ASR",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("12:30"),
        //     begin_time: TemporalTime.fromString("12:14"));
        // await Amplify.DataStore.save(Day2Prayer3);
        //
        // final Day2Prayer4 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "MAGHRIB",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("16:29"),
        //     begin_time: TemporalTime.fromString("16:14"));
        // await Amplify.DataStore.save(Day2Prayer4);
        //
        // final Day2Prayer5 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "JUMMAH",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("18:30"),
        //     begin_time: TemporalTime.fromString("18:14"));
        // await Amplify.DataStore.save(Day2Prayer5);
        //
        //
        // final Day2Prayer6 = MosquePrayers(
        //     mosqueID: mosque[0].getId(),
        //     prayer: "ISHA",
        //     Date: day2,
        //     //Date: null,
        //     end_time: TemporalTime.fromString("20:30"),
        //     begin_time: TemporalTime.fromString("20:14"));
        // await Amplify.DataStore.save(Day2Prayer6);
        // //await Future.delayed(Duration(milliseconds: 500));


      }
    } catch(e)
    {
      print(e);
    }
    //
  }


  void uploadFromExcel() async {
    try {
      mosque = await Amplify.DataStore.query(Mosque.classType);
      print(mosque.length);
      print(mosque);

      if (mosqueID.length > 0) {
        mosquePrayers = await Amplify.DataStore.query(
            MosquePrayers.classType,
            where: MosquePrayers.MOSQUEID.eq(mosqueID)
        );
        //await Amplify.DataStore.delete(mosquePrayers[0]);
        print(mosquePrayers.length);
        print(mosquePrayers);

        if (mosquePrayers.isEmpty) {
          //Add Mode
          print('Add mode');

        } else {
          //Edit Mode
          print('Edit mode');
          print(mosquePrayers.length);

          // print(mosquePrayers[0]);
          // print(mosquePrayers[1]);
          // print(mosquePrayers[2]);
          // print(mosquePrayers[3]);
          // print(mosquePrayers[4]);
          // print(mosquePrayers[5]);
          // print(mosquePrayers[6]);
          // print(mosquePrayers[7]);
          // print(mosquePrayers[8]);
          // print(mosquePrayers[9]);
          // print(mosquePrayers[10]);
          // print(mosquePrayers[11]);
          // print(mosquePrayers[12]);
          // print(mosquePrayers[13]);
          // print(mosquePrayers[14]);
          // print(mosquePrayers[15]);
          // print(mosquePrayers[16]);
          // print(mosquePrayers[17]);
          // print(mosquePrayers[18]);
          // print(mosquePrayers[19]);
          // print(mosquePrayers[20]);
          // print(mosquePrayers[21]);
          // print(mosquePrayers[22]);


          for (int rowIndex = 0; rowIndex <= mosquePrayers.length-1; rowIndex++) {
            await Amplify.DataStore.delete(mosquePrayers[rowIndex]);
          }
        }

        Uint8List bytes2 = Uint8List.fromList(File(_path).readAsBytesSync());
        var excel = Excel.decodeBytes(bytes2);

        for (var table in excel.tables.keys) {
          print(excel.tables.keys.length);
          print(excel.tables.length);
          print(table); //sheet Name
          print(excel.tables[table].maxCols);
          print(excel.tables[table].maxRows);

          Sheet sheetObject = excel[table];

          int totalRows = excel.tables[table].maxRows;

          for (int rowIndex = 0; rowIndex <= totalRows-1; rowIndex++) {
            if (rowIndex > 1 && rowIndex <= excel.tables[table].maxRows) {

              print('Row Index: $rowIndex');
              print(excel.tables[table].maxRows);

              var formatter = new DateFormat('yyyy-MM-dd');
              String formattedDate = formatter.format(DateTime.parse(sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex)).value.toString()));
              TemporalDate date = TemporalDate.fromString(formattedDate);
              print(date);
              //print(formattedTime);
              //String formattedTime = DateFormat('kk:mm:a').format(now);

              final DayPrayer1 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 1, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 2, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer1);

              final DayPrayer2 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 3, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 4, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer2);

              final DayPrayer3 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 5, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 6, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer3);

              final DayPrayer4 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 7, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 8, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer4);

              final DayPrayer5 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 9, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 10, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer5);

              final DayPrayer6 = MosquePrayers(
                  mosqueID: mosqueID,
                  prayer: sheetObject
                      .cell(
                      CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: 0))
                      .value
                      .toString(),
                  Date: date,
                  begin_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 11, rowIndex: rowIndex))
                      .value
                      .toString()),
                  end_time: TemporalTime.fromString(sheetObject
                      .cell(CellIndex.indexByColumnRow(
                      columnIndex: 12, rowIndex: rowIndex))
                      .value
                      .toString())
              );
              await Amplify.DataStore.save(DayPrayer6);

            }
          }
        }

      }
    } catch(e) {
      print('Exception in uploadFromExcel method, error: $e');
    }

  }

  _getHeaderAndBack() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          child: Text(
            AppTexts.UPLOAD_MOSQUE_PRAYERS,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: GestureDetector(
            onTap: ()=>    _navigateToMosqueDetailsScreen(), // Navigation.back(context),
            child: AssetImageWidget(
              image: ImageConstants.IC_BACK,
              height: 15,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }

  _getUploadAndCancelButton() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: () {
              //Navigation.back(context);
              _navigateToMosqueDetailsScreen();
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.UPLOAD,
              isFilled: true,
              callBack: () {
                uploadFromExcel();
                _navigateToMosqueDetailsScreen();
                //Navigation.back(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // _getListOfInfo() {
  //   return Column(
  //     children: [
  //       _getSchoolCollegeDropDown(),
  //       CustomSpacerWidget(
  //         height: 15,
  //       ),
  //       _getFromAndToDates(),
  //     ],
  //   );
  // }

  // _getSchoolCollegeDropDown() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 5, right: 5),
  //     child: DropDownTextField(
  //       fieldName: AppTexts.UPLOAD_MOSQUE_PRAYERS_TEXT,
  //       data: AppTexts.COLLEGE_CATEGORIES,
  //       callBack: (val) {
  //         print(val);
  //       },
  //     ),
  //   );
  // }
  //
  // _getFromAndToDates() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Flexible(
  //           child: Container(
  //             padding: EdgeInsets.only(left: 5, right: 5),
  //             child: DropDownTextField(
  //               fieldName: AppTexts.ADD_FROM,
  //               data: AppTexts.DATES_CATEGORIES,
  //               callBack: (val) {
  //                 print(val);
  //               },
  //             ),
  //           ),
  //         ),
  //         CustomSpacerWidget(
  //           width: 15,
  //         ),
  //         Flexible(
  //           child: Container(
  //             padding: EdgeInsets.only(left: 5, right: 5),
  //             child: DropDownTextField(
  //               fieldName: AppTexts.ADD_TO,
  //               data: AppTexts.DATES_CATEGORIES,
  //               callBack: (val) {
  //                 print(val);
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
import 'dart:io';
import 'dart:ui';
import 'package:amplify_flutter/amplify.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';
//import 'package:mus_greet/pages/upload_image/phonegallery.dart';


///Call this widget like this
/*_handleSearch() {
  print("Handle Search!!");
  showModalBottomSheet(
    elevation: 15,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: UploadImageBottomSheetWidget(),
      );
    },
  );
}*/



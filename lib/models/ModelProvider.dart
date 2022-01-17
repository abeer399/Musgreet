/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'Facilities.dart';
import 'Friend.dart';
import 'FriendRequest.dart';
import 'Interest.dart';
import 'Language.dart';
import 'Mosque.dart';
import 'MosqueFollower.dart';
import 'MosquePhoto.dart';
import 'MosquePrayer.dart';
import 'MosqueUser.dart';
import 'Notification.dart';
import 'Post.dart';
import 'PostComment.dart';
import 'PostLike.dart';
import 'User.dart';
import 'UserEducation.dart';
import 'UserFamily.dart';
import 'UserPhoto.dart';
import 'UserProfile.dart';

export 'Facilities.dart';
export 'Friend.dart';
export 'FriendRequest.dart';
export 'Interest.dart';
export 'Language.dart';
export 'Mosque.dart';
export 'MosqueFollower.dart';
export 'MosquePhoto.dart';
export 'MosquePrayer.dart';
export 'MosqueUser.dart';
export 'Notification.dart';
export 'Post.dart';
export 'PostComment.dart';
export 'PostLike.dart';
export 'User.dart';
export 'UserEducation.dart';
export 'UserFamily.dart';
export 'UserPhoto.dart';
export 'UserProfile.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "017c854708b97c012313d16c665d3bb0";
  @override
  List<ModelSchema> modelSchemas = [
    Facilities.schema,
    Friend.schema,
    FriendRequest.schema,
    Interest.schema,
    Language.schema,
    Mosque.schema,
    MosqueFollower.schema,
    MosquePhoto.schema,
    MosquePrayer.schema,
    MosqueUser.schema,
    Notification.schema,
    Post.schema,
    PostComment.schema,
    PostLike.schema,
    User.schema,
    UserEducation.schema,
    UserFamily.schema,
    UserPhoto.schema,
    UserProfile.schema
  ];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case "Facilities":
        {
          return Facilities.classType;
        }
        break;
      case "Friend":
        {
          return Friend.classType;
        }
        break;
      case "FriendRequest":
        {
          return FriendRequest.classType;
        }
        break;
      case "Interest":
        {
          return Interest.classType;
        }
        break;
      case "Language":
        {
          return Language.classType;
        }
        break;
      case "Mosque":
        {
          return Mosque.classType;
        }
        break;
      case "MosqueFollower":
        {
          return MosqueFollower.classType;
        }
        break;
      case "MosquePhoto":
        {
          return MosquePhoto.classType;
        }
        break;
      case "MosquePrayer":
        {
          return MosquePrayer.classType;
        }
        break;
      case "MosqueUser":
        {
          return MosqueUser.classType;
        }
        break;
      case "Notification":
        {
          return Notification.classType;
        }
        break;
      case "Post":
        {
          return Post.classType;
        }
        break;
      case "PostComment":
        {
          return PostComment.classType;
        }
        break;
      case "PostLike":
        {
          return PostLike.classType;
        }
        break;
      case "User":
        {
          return User.classType;
        }
        break;
      case "UserEducation":
        {
          return UserEducation.classType;
        }
        break;
      case "UserFamily":
        {
          return UserFamily.classType;
        }
        break;
      case "UserPhoto":
        {
          return UserPhoto.classType;
        }
        break;
      case "UserProfile":
        {
          return UserProfile.classType;
        }
        break;
      default:
        {
          throw Exception(
              "Failed to find model in model provider for model name: " +
                  modelName);
        }
    }
  }
}

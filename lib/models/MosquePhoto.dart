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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the MosquePhoto type in your schema. */
@immutable
class MosquePhoto extends Model {
  static const classType = const _MosquePhotoModelType();
  final String id;
  final String photo_type;
  final String photo_path;
  final String mosque_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosquePhoto._internal(
      {@required this.id, this.photo_type, this.photo_path, this.mosque_id});

  factory MosquePhoto(
      {String id, String photo_type, String photo_path, String mosque_id}) {
    return MosquePhoto._internal(
        id: id == null ? UUID.getUUID() : id,
        photo_type: photo_type,
        photo_path: photo_path,
        mosque_id: mosque_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosquePhoto &&
        id == other.id &&
        photo_type == other.photo_type &&
        photo_path == other.photo_path &&
        mosque_id == other.mosque_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosquePhoto {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photo_type=" + "$photo_type" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("mosque_id=" + "$mosque_id");
    buffer.write("}");

    return buffer.toString();
  }

  MosquePhoto copyWith(
      {String id, String photo_type, String photo_path, String mosque_id}) {
    return MosquePhoto(
        id: id ?? this.id,
        photo_type: photo_type ?? this.photo_type,
        photo_path: photo_path ?? this.photo_path,
        mosque_id: mosque_id ?? this.mosque_id);
  }

  MosquePhoto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo_type = json['photo_type'],
        photo_path = json['photo_path'],
        mosque_id = json['mosque_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo_type': photo_type,
        'photo_path': photo_path,
        'mosque_id': mosque_id
      };

  static final QueryField ID = QueryField(fieldName: "mosquePhoto.id");
  static final QueryField PHOTO_TYPE = QueryField(fieldName: "photo_type");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosquePhoto";
    modelSchemaDefinition.pluralName = "MosquePhotos";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePhoto.PHOTO_TYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePhoto.PHOTO_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePhoto.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosquePhotoModelType extends ModelType<MosquePhoto> {
  const _MosquePhotoModelType();

  @override
  MosquePhoto fromJson(Map<String, dynamic> jsonData) {
    return MosquePhoto.fromJson(jsonData);
  }
}

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

/** This is an auto generated class representing the MosqueUser type in your schema. */
@immutable
class MosqueUser extends Model {
  static const classType = const _MosqueUserModelType();
  final String id;
  final String name;
  final String designation;
  final String role;
  final String photo_path;
  final String mosque_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosqueUser._internal(
      {@required this.id,
      this.name,
      this.designation,
      this.role,
      this.photo_path,
      this.mosque_id});

  factory MosqueUser(
      {String id,
      String name,
      String designation,
      String role,
      String photo_path,
      String mosque_id}) {
    return MosqueUser._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        designation: designation,
        role: role,
        photo_path: photo_path,
        mosque_id: mosque_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosqueUser &&
        id == other.id &&
        name == other.name &&
        designation == other.designation &&
        role == other.role &&
        photo_path == other.photo_path &&
        mosque_id == other.mosque_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosqueUser {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("designation=" + "$designation" + ", ");
    buffer.write("role=" + "$role" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("mosque_id=" + "$mosque_id");
    buffer.write("}");

    return buffer.toString();
  }

  MosqueUser copyWith(
      {String id,
      String name,
      String designation,
      String role,
      String photo_path,
      String mosque_id}) {
    return MosqueUser(
        id: id ?? this.id,
        name: name ?? this.name,
        designation: designation ?? this.designation,
        role: role ?? this.role,
        photo_path: photo_path ?? this.photo_path,
        mosque_id: mosque_id ?? this.mosque_id);
  }

  MosqueUser.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        designation = json['designation'],
        role = json['role'],
        photo_path = json['photo_path'],
        mosque_id = json['mosque_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'designation': designation,
        'role': role,
        'photo_path': photo_path,
        'mosque_id': mosque_id
      };

  static final QueryField ID = QueryField(fieldName: "mosqueUser.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField DESIGNATION = QueryField(fieldName: "designation");
  static final QueryField ROLE = QueryField(fieldName: "role");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosqueUser";
    modelSchemaDefinition.pluralName = "MosqueUsers";

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
        key: MosqueUser.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueUser.DESIGNATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueUser.ROLE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueUser.PHOTO_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueUser.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosqueUserModelType extends ModelType<MosqueUser> {
  const _MosqueUserModelType();

  @override
  MosqueUser fromJson(Map<String, dynamic> jsonData) {
    return MosqueUser.fromJson(jsonData);
  }
}

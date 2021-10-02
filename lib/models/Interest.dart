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

/** This is an auto generated class representing the Interest type in your schema. */
@immutable
class Interest extends Model {
  static const classType = const _InterestModelType();
  final String id;
  final String photo_path;
  final String interest_name;
  final String description;
  final String category_name;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Interest._internal(
      {@required this.id,
      this.photo_path,
      this.interest_name,
      this.description,
      this.category_name});

  factory Interest(
      {String id,
      String photo_path,
      String interest_name,
      String description,
      String category_name}) {
    return Interest._internal(
        id: id == null ? UUID.getUUID() : id,
        photo_path: photo_path,
        interest_name: interest_name,
        description: description,
        category_name: category_name);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Interest &&
        id == other.id &&
        photo_path == other.photo_path &&
        interest_name == other.interest_name &&
        description == other.description &&
        category_name == other.category_name;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Interest {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("interest_name=" + "$interest_name" + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("category_name=" + "$category_name");
    buffer.write("}");

    return buffer.toString();
  }

  Interest copyWith(
      {String id,
      String photo_path,
      String interest_name,
      String description,
      String category_name}) {
    return Interest(
        id: id ?? this.id,
        photo_path: photo_path ?? this.photo_path,
        interest_name: interest_name ?? this.interest_name,
        description: description ?? this.description,
        category_name: category_name ?? this.category_name);
  }

  Interest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photo_path = json['photo_path'],
        interest_name = json['interest_name'],
        description = json['description'],
        category_name = json['category_name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photo_path': photo_path,
        'interest_name': interest_name,
        'description': description,
        'category_name': category_name
      };

  static final QueryField ID = QueryField(fieldName: "interest.id");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField INTEREST_NAME =
      QueryField(fieldName: "interest_name");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CATEGORY_NAME =
      QueryField(fieldName: "category_name");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Interest";
    modelSchemaDefinition.pluralName = "Interests";

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
        key: Interest.PHOTO_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Interest.INTEREST_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Interest.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Interest.CATEGORY_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _InterestModelType extends ModelType<Interest> {
  const _InterestModelType();

  @override
  Interest fromJson(Map<String, dynamic> jsonData) {
    return Interest.fromJson(jsonData);
  }
}

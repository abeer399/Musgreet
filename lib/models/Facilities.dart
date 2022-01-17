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

/** This is an auto generated class representing the Facilities type in your schema. */
@immutable
class Facilities extends Model {
  static const classType = const _FacilitiesModelType();
  final String id;
  final String icon_path;
  final String facility_header;
  final String description;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Facilities._internal(
      {@required this.id,
      this.icon_path,
      this.facility_header,
      this.description});

  factory Facilities(
      {String id,
      String icon_path,
      String facility_header,
      String description}) {
    return Facilities._internal(
        id: id == null ? UUID.getUUID() : id,
        icon_path: icon_path,
        facility_header: facility_header,
        description: description);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Facilities &&
        id == other.id &&
        icon_path == other.icon_path &&
        facility_header == other.facility_header &&
        description == other.description;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Facilities {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("icon_path=" + "$icon_path" + ", ");
    buffer.write("facility_header=" + "$facility_header" + ", ");
    buffer.write("description=" + "$description");
    buffer.write("}");

    return buffer.toString();
  }

  Facilities copyWith(
      {String id,
      String icon_path,
      String facility_header,
      String description}) {
    return Facilities(
        id: id ?? this.id,
        icon_path: icon_path ?? this.icon_path,
        facility_header: facility_header ?? this.facility_header,
        description: description ?? this.description);
  }

  Facilities.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        icon_path = json['icon_path'],
        facility_header = json['facility_header'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon_path': icon_path,
        'facility_header': facility_header,
        'description': description
      };

  static final QueryField ID = QueryField(fieldName: "facilities.id");
  static final QueryField ICON_PATH = QueryField(fieldName: "icon_path");
  static final QueryField FACILITY_HEADER =
      QueryField(fieldName: "facility_header");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Facilities";
    modelSchemaDefinition.pluralName = "Facilities";

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
        key: Facilities.ICON_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Facilities.FACILITY_HEADER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Facilities.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _FacilitiesModelType extends ModelType<Facilities> {
  const _FacilitiesModelType();

  @override
  Facilities fromJson(Map<String, dynamic> jsonData) {
    return Facilities.fromJson(jsonData);
  }
}

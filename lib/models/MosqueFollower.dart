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

/** This is an auto generated class representing the MosqueFollower type in your schema. */
@immutable
class MosqueFollower extends Model {
  static const classType = const _MosqueFollowerModelType();
  final String id;
  final String mosque_id;
  final String user_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosqueFollower._internal(
      {@required this.id, this.mosque_id, this.user_id});

  factory MosqueFollower({String id, String mosque_id, String user_id}) {
    return MosqueFollower._internal(
        id: id == null ? UUID.getUUID() : id,
        mosque_id: mosque_id,
        user_id: user_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosqueFollower &&
        id == other.id &&
        mosque_id == other.mosque_id &&
        user_id == other.user_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosqueFollower {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("mosque_id=" + "$mosque_id" + ", ");
    buffer.write("user_id=" + "$user_id");
    buffer.write("}");

    return buffer.toString();
  }

  MosqueFollower copyWith({String id, String mosque_id, String user_id}) {
    return MosqueFollower(
        id: id ?? this.id,
        mosque_id: mosque_id ?? this.mosque_id,
        user_id: user_id ?? this.user_id);
  }

  MosqueFollower.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mosque_id = json['mosque_id'],
        user_id = json['user_id'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'mosque_id': mosque_id, 'user_id': user_id};

  static final QueryField ID = QueryField(fieldName: "mosqueFollower.id");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosqueFollower";
    modelSchemaDefinition.pluralName = "MosqueFollowers";

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
        key: MosqueFollower.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueFollower.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosqueFollowerModelType extends ModelType<MosqueFollower> {
  const _MosqueFollowerModelType();

  @override
  MosqueFollower fromJson(Map<String, dynamic> jsonData) {
    return MosqueFollower.fromJson(jsonData);
  }
}

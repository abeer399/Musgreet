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

/** This is an auto generated class representing the Friend type in your schema. */
@immutable
class Friend extends Model {
  static const classType = const _FriendModelType();
  final String id;
  final String friends_list;
  final String user_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Friend._internal({@required this.id, this.friends_list, this.user_id});

  factory Friend({String id, String friends_list, String user_id}) {
    return Friend._internal(
        id: id == null ? UUID.getUUID() : id,
        friends_list: friends_list,
        user_id: user_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friend &&
        id == other.id &&
        friends_list == other.friends_list &&
        user_id == other.user_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Friend {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("friends_list=" + "$friends_list" + ", ");
    buffer.write("user_id=" + "$user_id");
    buffer.write("}");

    return buffer.toString();
  }

  Friend copyWith({String id, String friends_list, String user_id}) {
    return Friend(
        id: id ?? this.id,
        friends_list: friends_list ?? this.friends_list,
        user_id: user_id ?? this.user_id);
  }

  Friend.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        friends_list = json['friends_list'],
        user_id = json['user_id'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'friends_list': friends_list, 'user_id': user_id};

  static final QueryField ID = QueryField(fieldName: "friend.id");
  static final QueryField FRIENDS_LIST = QueryField(fieldName: "friends_list");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Friend";
    modelSchemaDefinition.pluralName = "Friends";

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
        key: Friend.FRIENDS_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Friend.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _FriendModelType extends ModelType<Friend> {
  const _FriendModelType();

  @override
  Friend fromJson(Map<String, dynamic> jsonData) {
    return Friend.fromJson(jsonData);
  }
}

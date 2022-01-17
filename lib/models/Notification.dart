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

/** This is an auto generated class representing the Notification type in your schema. */
@immutable
class Notification extends Model {
  static const classType = const _NotificationModelType();
  final String id;
  final String sent_by;
  final String sent_to_list;
  final String type;
  final String message;
  final TemporalDateTime sent_datetime;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Notification._internal(
      {@required this.id,
      this.sent_by,
      this.sent_to_list,
      this.type,
      this.message,
      this.sent_datetime});

  factory Notification(
      {String id,
      String sent_by,
      String sent_to_list,
      String type,
      String message,
      TemporalDateTime sent_datetime}) {
    return Notification._internal(
        id: id == null ? UUID.getUUID() : id,
        sent_by: sent_by,
        sent_to_list: sent_to_list,
        type: type,
        message: message,
        sent_datetime: sent_datetime);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
        id == other.id &&
        sent_by == other.sent_by &&
        sent_to_list == other.sent_to_list &&
        type == other.type &&
        message == other.message &&
        sent_datetime == other.sent_datetime;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Notification {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("sent_by=" + "$sent_by" + ", ");
    buffer.write("sent_to_list=" + "$sent_to_list" + ", ");
    buffer.write("type=" + "$type" + ", ");
    buffer.write("message=" + "$message" + ", ");
    buffer.write("sent_datetime=" +
        (sent_datetime != null ? sent_datetime.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Notification copyWith(
      {String id,
      String sent_by,
      String sent_to_list,
      String type,
      String message,
      TemporalDateTime sent_datetime}) {
    return Notification(
        id: id ?? this.id,
        sent_by: sent_by ?? this.sent_by,
        sent_to_list: sent_to_list ?? this.sent_to_list,
        type: type ?? this.type,
        message: message ?? this.message,
        sent_datetime: sent_datetime ?? this.sent_datetime);
  }

  Notification.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sent_by = json['sent_by'],
        sent_to_list = json['sent_to_list'],
        type = json['type'],
        message = json['message'],
        sent_datetime = json['sent_datetime'] != null
            ? TemporalDateTime.fromString(json['sent_datetime'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'sent_by': sent_by,
        'sent_to_list': sent_to_list,
        'type': type,
        'message': message,
        'sent_datetime': sent_datetime?.format()
      };

  static final QueryField ID = QueryField(fieldName: "notification.id");
  static final QueryField SENT_BY = QueryField(fieldName: "sent_by");
  static final QueryField SENT_TO_LIST = QueryField(fieldName: "sent_to_list");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField MESSAGE = QueryField(fieldName: "message");
  static final QueryField SENT_DATETIME =
      QueryField(fieldName: "sent_datetime");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Notification";
    modelSchemaDefinition.pluralName = "Notifications";

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
        key: Notification.SENT_BY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Notification.SENT_TO_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Notification.TYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Notification.MESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Notification.SENT_DATETIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));
  });
}

class _NotificationModelType extends ModelType<Notification> {
  const _NotificationModelType();

  @override
  Notification fromJson(Map<String, dynamic> jsonData) {
    return Notification.fromJson(jsonData);
  }
}

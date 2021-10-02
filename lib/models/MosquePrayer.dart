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

/** This is an auto generated class representing the MosquePrayer type in your schema. */
@immutable
class MosquePrayer extends Model {
  static const classType = const _MosquePrayerModelType();
  final String id;
  final String prayer;
  final String mosque_id;
  final TemporalDate date;
  final TemporalTime end_time;
  final TemporalTime begin_time;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosquePrayer._internal(
      {@required this.id,
      this.prayer,
      this.mosque_id,
      this.date,
      this.end_time,
      this.begin_time});

  factory MosquePrayer(
      {String id,
      String prayer,
      String mosque_id,
      TemporalDate date,
      TemporalTime end_time,
      TemporalTime begin_time}) {
    return MosquePrayer._internal(
        id: id == null ? UUID.getUUID() : id,
        prayer: prayer,
        mosque_id: mosque_id,
        date: date,
        end_time: end_time,
        begin_time: begin_time);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosquePrayer &&
        id == other.id &&
        prayer == other.prayer &&
        mosque_id == other.mosque_id &&
        date == other.date &&
        end_time == other.end_time &&
        begin_time == other.begin_time;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosquePrayer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("prayer=" + "$prayer" + ", ");
    buffer.write("mosque_id=" + "$mosque_id" + ", ");
    buffer.write("date=" + (date != null ? date.format() : "null") + ", ");
    buffer.write(
        "end_time=" + (end_time != null ? end_time.format() : "null") + ", ");
    buffer.write(
        "begin_time=" + (begin_time != null ? begin_time.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  MosquePrayer copyWith(
      {String id,
      String prayer,
      String mosque_id,
      TemporalDate date,
      TemporalTime end_time,
      TemporalTime begin_time}) {
    return MosquePrayer(
        id: id ?? this.id,
        prayer: prayer ?? this.prayer,
        mosque_id: mosque_id ?? this.mosque_id,
        date: date ?? this.date,
        end_time: end_time ?? this.end_time,
        begin_time: begin_time ?? this.begin_time);
  }

  MosquePrayer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        prayer = json['prayer'],
        mosque_id = json['mosque_id'],
        date =
            json['date'] != null ? TemporalDate.fromString(json['date']) : null,
        end_time = json['end_time'] != null
            ? TemporalTime.fromString(json['end_time'])
            : null,
        begin_time = json['begin_time'] != null
            ? TemporalTime.fromString(json['begin_time'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'prayer': prayer,
        'mosque_id': mosque_id,
        'date': date?.format(),
        'end_time': end_time?.format(),
        'begin_time': begin_time?.format()
      };

  static final QueryField ID = QueryField(fieldName: "mosquePrayer.id");
  static final QueryField PRAYER = QueryField(fieldName: "prayer");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField END_TIME = QueryField(fieldName: "end_time");
  static final QueryField BEGIN_TIME = QueryField(fieldName: "begin_time");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosquePrayer";
    modelSchemaDefinition.pluralName = "MosquePrayers";

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
        key: MosquePrayer.PRAYER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayer.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayer.DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayer.END_TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosquePrayer.BEGIN_TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));
  });
}

class _MosquePrayerModelType extends ModelType<MosquePrayer> {
  const _MosquePrayerModelType();

  @override
  MosquePrayer fromJson(Map<String, dynamic> jsonData) {
    return MosquePrayer.fromJson(jsonData);
  }
}

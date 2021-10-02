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

/** This is an auto generated class representing the MosqueDonations type in your schema. */
@immutable
class MosqueDonations extends Model {
  static const classType = const _MosqueDonationsModelType();
  final String id;
  final String user_id;
  final String first_name;
  final String last_nam;
  final String email;
  final double donation_amount;
  final String frequency;
  final bool user_covers_cost;
  final TemporalDate transaction_date;
  final String transaction_status;
  final TemporalDateTime next_donation_date;
  final String mosque_id;
  final TemporalTime transaction_time;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const MosqueDonations._internal(
      {@required this.id,
      this.user_id,
      this.first_name,
      this.last_nam,
      this.email,
      this.donation_amount,
      this.frequency,
      this.user_covers_cost,
      this.transaction_date,
      this.transaction_status,
      this.next_donation_date,
      this.mosque_id,
      this.transaction_time});

  factory MosqueDonations(
      {String id,
      String user_id,
      String first_name,
      String last_nam,
      String email,
      double donation_amount,
      String frequency,
      bool user_covers_cost,
      TemporalDate transaction_date,
      String transaction_status,
      TemporalDateTime next_donation_date,
      String mosque_id,
      TemporalTime transaction_time}) {
    return MosqueDonations._internal(
        id: id == null ? UUID.getUUID() : id,
        user_id: user_id,
        first_name: first_name,
        last_nam: last_nam,
        email: email,
        donation_amount: donation_amount,
        frequency: frequency,
        user_covers_cost: user_covers_cost,
        transaction_date: transaction_date,
        transaction_status: transaction_status,
        next_donation_date: next_donation_date,
        mosque_id: mosque_id,
        transaction_time: transaction_time);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MosqueDonations &&
        id == other.id &&
        user_id == other.user_id &&
        first_name == other.first_name &&
        last_nam == other.last_nam &&
        email == other.email &&
        donation_amount == other.donation_amount &&
        frequency == other.frequency &&
        user_covers_cost == other.user_covers_cost &&
        transaction_date == other.transaction_date &&
        transaction_status == other.transaction_status &&
        next_donation_date == other.next_donation_date &&
        mosque_id == other.mosque_id &&
        transaction_time == other.transaction_time;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("MosqueDonations {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("user_id=" + "$user_id" + ", ");
    buffer.write("first_name=" + "$first_name" + ", ");
    buffer.write("last_nam=" + "$last_nam" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("donation_amount=" +
        (donation_amount != null ? donation_amount.toString() : "null") +
        ", ");
    buffer.write("frequency=" + "$frequency" + ", ");
    buffer.write("user_covers_cost=" +
        (user_covers_cost != null ? user_covers_cost.toString() : "null") +
        ", ");
    buffer.write("transaction_date=" +
        (transaction_date != null ? transaction_date.format() : "null") +
        ", ");
    buffer.write("transaction_status=" + "$transaction_status" + ", ");
    buffer.write("next_donation_date=" +
        (next_donation_date != null ? next_donation_date.format() : "null") +
        ", ");
    buffer.write("mosque_id=" + "$mosque_id" + ", ");
    buffer.write("transaction_time=" +
        (transaction_time != null ? transaction_time.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  MosqueDonations copyWith(
      {String id,
      String user_id,
      String first_name,
      String last_nam,
      String email,
      double donation_amount,
      String frequency,
      bool user_covers_cost,
      TemporalDate transaction_date,
      String transaction_status,
      TemporalDateTime next_donation_date,
      String mosque_id,
      TemporalTime transaction_time}) {
    return MosqueDonations(
        id: id ?? this.id,
        user_id: user_id ?? this.user_id,
        first_name: first_name ?? this.first_name,
        last_nam: last_nam ?? this.last_nam,
        email: email ?? this.email,
        donation_amount: donation_amount ?? this.donation_amount,
        frequency: frequency ?? this.frequency,
        user_covers_cost: user_covers_cost ?? this.user_covers_cost,
        transaction_date: transaction_date ?? this.transaction_date,
        transaction_status: transaction_status ?? this.transaction_status,
        next_donation_date: next_donation_date ?? this.next_donation_date,
        mosque_id: mosque_id ?? this.mosque_id,
        transaction_time: transaction_time ?? this.transaction_time);
  }

  MosqueDonations.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user_id = json['user_id'],
        first_name = json['first_name'],
        last_nam = json['last_nam'],
        email = json['email'],
        donation_amount = (json['donation_amount'] as num)?.toDouble(),
        frequency = json['frequency'],
        user_covers_cost = json['user_covers_cost'],
        transaction_date = json['transaction_date'] != null
            ? TemporalDate.fromString(json['transaction_date'])
            : null,
        transaction_status = json['transaction_status'],
        next_donation_date = json['next_donation_date'] != null
            ? TemporalDateTime.fromString(json['next_donation_date'])
            : null,
        mosque_id = json['mosque_id'],
        transaction_time = json['transaction_time'] != null
            ? TemporalTime.fromString(json['transaction_time'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': user_id,
        'first_name': first_name,
        'last_nam': last_nam,
        'email': email,
        'donation_amount': donation_amount,
        'frequency': frequency,
        'user_covers_cost': user_covers_cost,
        'transaction_date': transaction_date?.format(),
        'transaction_status': transaction_status,
        'next_donation_date': next_donation_date?.format(),
        'mosque_id': mosque_id,
        'transaction_time': transaction_time?.format()
      };

  static final QueryField ID = QueryField(fieldName: "mosqueDonations.id");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static final QueryField FIRST_NAME = QueryField(fieldName: "first_name");
  static final QueryField LAST_NAM = QueryField(fieldName: "last_nam");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField DONATION_AMOUNT =
      QueryField(fieldName: "donation_amount");
  static final QueryField FREQUENCY = QueryField(fieldName: "frequency");
  static final QueryField USER_COVERS_COST =
      QueryField(fieldName: "user_covers_cost");
  static final QueryField TRANSACTION_DATE =
      QueryField(fieldName: "transaction_date");
  static final QueryField TRANSACTION_STATUS =
      QueryField(fieldName: "transaction_status");
  static final QueryField NEXT_DONATION_DATE =
      QueryField(fieldName: "next_donation_date");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static final QueryField TRANSACTION_TIME =
      QueryField(fieldName: "transaction_time");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MosqueDonations";
    modelSchemaDefinition.pluralName = "MosqueDonations";

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
        key: MosqueDonations.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.FIRST_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.LAST_NAM,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.DONATION_AMOUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.FREQUENCY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.USER_COVERS_COST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.TRANSACTION_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.TRANSACTION_STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.NEXT_DONATION_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: MosqueDonations.TRANSACTION_TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.time)));
  });
}

class _MosqueDonationsModelType extends ModelType<MosqueDonations> {
  const _MosqueDonationsModelType();

  @override
  MosqueDonations fromJson(Map<String, dynamic> jsonData) {
    return MosqueDonations.fromJson(jsonData);
  }
}

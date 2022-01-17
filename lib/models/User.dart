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

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String phone;
  final TemporalDate dob;
  final String gender;
  final String parent_email;
  final String house_number;
  final String street;
  final String city;
  final String postcode;
  final String country;
  final String latitude;
  final String longitude;
  final bool parent_consent_form_agree;
  final bool terms_privacy_policy_agree;
  final bool community_promise_agree;
  final bool email_verification;
  final bool phone_verification;
  final bool parent_verification;
  final bool address_verification;
  final bool photo_verification;
  final TemporalDate joined_date;
  final bool active_status;
  final String address_verification_mode;
  final String manual_address_code;
  final TemporalDate manual_address_taken_date;
  final TemporalDate manual_address_code_sent_date;
  final bool mosque_admin;
  final String photo_path;
  final String selfie_path;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.password,
      this.phone,
      this.dob,
      this.gender,
      this.parent_email,
      this.house_number,
      this.street,
      this.city,
      this.postcode,
      this.country,
      this.latitude,
      this.longitude,
      this.parent_consent_form_agree,
      this.terms_privacy_policy_agree,
      this.community_promise_agree,
      this.email_verification,
      this.phone_verification,
      this.parent_verification,
      this.address_verification,
      this.photo_verification,
      this.joined_date,
      this.active_status,
      this.address_verification_mode,
      this.manual_address_code,
      this.manual_address_taken_date,
      this.manual_address_code_sent_date,
      this.mosque_admin,
      this.photo_path,
      this.selfie_path});

  factory User(
      {String id,
      String first_name,
      String last_name,
      String email,
      String password,
      String phone,
      TemporalDate dob,
      String gender,
      String parent_email,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String latitude,
      String longitude,
      bool parent_consent_form_agree,
      bool terms_privacy_policy_agree,
      bool community_promise_agree,
      bool email_verification,
      bool phone_verification,
      bool parent_verification,
      bool address_verification,
      bool photo_verification,
      TemporalDate joined_date,
      bool active_status,
      String address_verification_mode,
      String manual_address_code,
      TemporalDate manual_address_taken_date,
      TemporalDate manual_address_code_sent_date,
      bool mosque_admin,
      String photo_path,
      String selfie_path}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: password,
        phone: phone,
        dob: dob,
        gender: gender,
        parent_email: parent_email,
        house_number: house_number,
        street: street,
        city: city,
        postcode: postcode,
        country: country,
        latitude: latitude,
        longitude: longitude,
        parent_consent_form_agree: parent_consent_form_agree,
        terms_privacy_policy_agree: terms_privacy_policy_agree,
        community_promise_agree: community_promise_agree,
        email_verification: email_verification,
        phone_verification: phone_verification,
        parent_verification: parent_verification,
        address_verification: address_verification,
        photo_verification: photo_verification,
        joined_date: joined_date,
        active_status: active_status,
        address_verification_mode: address_verification_mode,
        manual_address_code: manual_address_code,
        manual_address_taken_date: manual_address_taken_date,
        manual_address_code_sent_date: manual_address_code_sent_date,
        mosque_admin: mosque_admin,
        photo_path: photo_path,
        selfie_path: selfie_path);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        first_name == other.first_name &&
        last_name == other.last_name &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        dob == other.dob &&
        gender == other.gender &&
        parent_email == other.parent_email &&
        house_number == other.house_number &&
        street == other.street &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        parent_consent_form_agree == other.parent_consent_form_agree &&
        terms_privacy_policy_agree == other.terms_privacy_policy_agree &&
        community_promise_agree == other.community_promise_agree &&
        email_verification == other.email_verification &&
        phone_verification == other.phone_verification &&
        parent_verification == other.parent_verification &&
        address_verification == other.address_verification &&
        photo_verification == other.photo_verification &&
        joined_date == other.joined_date &&
        active_status == other.active_status &&
        address_verification_mode == other.address_verification_mode &&
        manual_address_code == other.manual_address_code &&
        manual_address_taken_date == other.manual_address_taken_date &&
        manual_address_code_sent_date == other.manual_address_code_sent_date &&
        mosque_admin == other.mosque_admin &&
        photo_path == other.photo_path &&
        selfie_path == other.selfie_path;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("first_name=" + "$first_name" + ", ");
    buffer.write("last_name=" + "$last_name" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("password=" + "$password" + ", ");
    buffer.write("phone=" + "$phone" + ", ");
    buffer.write("dob=" + (dob != null ? dob.format() : "null") + ", ");
    buffer.write("gender=" + "$gender" + ", ");
    buffer.write("parent_email=" + "$parent_email" + ", ");
    buffer.write("house_number=" + "$house_number" + ", ");
    buffer.write("street=" + "$street" + ", ");
    buffer.write("city=" + "$city" + ", ");
    buffer.write("postcode=" + "$postcode" + ", ");
    buffer.write("country=" + "$country" + ", ");
    buffer.write("latitude=" + "$latitude" + ", ");
    buffer.write("longitude=" + "$longitude" + ", ");
    buffer.write("parent_consent_form_agree=" +
        (parent_consent_form_agree != null
            ? parent_consent_form_agree.toString()
            : "null") +
        ", ");
    buffer.write("terms_privacy_policy_agree=" +
        (terms_privacy_policy_agree != null
            ? terms_privacy_policy_agree.toString()
            : "null") +
        ", ");
    buffer.write("community_promise_agree=" +
        (community_promise_agree != null
            ? community_promise_agree.toString()
            : "null") +
        ", ");
    buffer.write("email_verification=" +
        (email_verification != null ? email_verification.toString() : "null") +
        ", ");
    buffer.write("phone_verification=" +
        (phone_verification != null ? phone_verification.toString() : "null") +
        ", ");
    buffer.write("parent_verification=" +
        (parent_verification != null
            ? parent_verification.toString()
            : "null") +
        ", ");
    buffer.write("address_verification=" +
        (address_verification != null
            ? address_verification.toString()
            : "null") +
        ", ");
    buffer.write("photo_verification=" +
        (photo_verification != null ? photo_verification.toString() : "null") +
        ", ");
    buffer.write("joined_date=" +
        (joined_date != null ? joined_date.format() : "null") +
        ", ");
    buffer.write("active_status=" +
        (active_status != null ? active_status.toString() : "null") +
        ", ");
    buffer.write(
        "address_verification_mode=" + "$address_verification_mode" + ", ");
    buffer.write("manual_address_code=" + "$manual_address_code" + ", ");
    buffer.write("manual_address_taken_date=" +
        (manual_address_taken_date != null
            ? manual_address_taken_date.format()
            : "null") +
        ", ");
    buffer.write("manual_address_code_sent_date=" +
        (manual_address_code_sent_date != null
            ? manual_address_code_sent_date.format()
            : "null") +
        ", ");
    buffer.write("mosque_admin=" +
        (mosque_admin != null ? mosque_admin.toString() : "null") +
        ", ");
    buffer.write("photo_path=" + "$photo_path" + ", ");
    buffer.write("selfie_path=" + "$selfie_path");
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String first_name,
      String last_name,
      String email,
      String password,
      String phone,
      TemporalDate dob,
      String gender,
      String parent_email,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String latitude,
      String longitude,
      bool parent_consent_form_agree,
      bool terms_privacy_policy_agree,
      bool community_promise_agree,
      bool email_verification,
      bool phone_verification,
      bool parent_verification,
      bool address_verification,
      bool photo_verification,
      TemporalDate joined_date,
      bool active_status,
      String address_verification_mode,
      String manual_address_code,
      TemporalDate manual_address_taken_date,
      TemporalDate manual_address_code_sent_date,
      bool mosque_admin,
      String photo_path,
      String selfie_path}) {
    return User(
        id: id ?? this.id,
        first_name: first_name ?? this.first_name,
        last_name: last_name ?? this.last_name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        parent_email: parent_email ?? this.parent_email,
        house_number: house_number ?? this.house_number,
        street: street ?? this.street,
        city: city ?? this.city,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        parent_consent_form_agree:
            parent_consent_form_agree ?? this.parent_consent_form_agree,
        terms_privacy_policy_agree:
            terms_privacy_policy_agree ?? this.terms_privacy_policy_agree,
        community_promise_agree:
            community_promise_agree ?? this.community_promise_agree,
        email_verification: email_verification ?? this.email_verification,
        phone_verification: phone_verification ?? this.phone_verification,
        parent_verification: parent_verification ?? this.parent_verification,
        address_verification: address_verification ?? this.address_verification,
        photo_verification: photo_verification ?? this.photo_verification,
        joined_date: joined_date ?? this.joined_date,
        active_status: active_status ?? this.active_status,
        address_verification_mode:
            address_verification_mode ?? this.address_verification_mode,
        manual_address_code: manual_address_code ?? this.manual_address_code,
        manual_address_taken_date:
            manual_address_taken_date ?? this.manual_address_taken_date,
        manual_address_code_sent_date:
            manual_address_code_sent_date ?? this.manual_address_code_sent_date,
        mosque_admin: mosque_admin ?? this.mosque_admin,
        photo_path: photo_path ?? this.photo_path,
        selfie_path: selfie_path ?? this.selfie_path);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        email = json['email'],
        password = json['password'],
        phone = json['phone'],
        dob = json['dob'] != null ? TemporalDate.fromString(json['dob']) : null,
        gender = json['gender'],
        parent_email = json['parent_email'],
        house_number = json['house_number'],
        street = json['street'],
        city = json['city'],
        postcode = json['postcode'],
        country = json['country'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        parent_consent_form_agree = json['parent_consent_form_agree'],
        terms_privacy_policy_agree = json['terms_privacy_policy_agree'],
        community_promise_agree = json['community_promise_agree'],
        email_verification = json['email_verification'],
        phone_verification = json['phone_verification'],
        parent_verification = json['parent_verification'],
        address_verification = json['address_verification'],
        photo_verification = json['photo_verification'],
        joined_date = json['joined_date'] != null
            ? TemporalDate.fromString(json['joined_date'])
            : null,
        active_status = json['active_status'],
        address_verification_mode = json['address_verification_mode'],
        manual_address_code = json['manual_address_code'],
        manual_address_taken_date = json['manual_address_taken_date'] != null
            ? TemporalDate.fromString(json['manual_address_taken_date'])
            : null,
        manual_address_code_sent_date =
            json['manual_address_code_sent_date'] != null
                ? TemporalDate.fromString(json['manual_address_code_sent_date'])
                : null,
        mosque_admin = json['mosque_admin'],
        photo_path = json['photo_path'],
        selfie_path = json['selfie_path'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'phone': phone,
        'dob': dob?.format(),
        'gender': gender,
        'parent_email': parent_email,
        'house_number': house_number,
        'street': street,
        'city': city,
        'postcode': postcode,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
        'parent_consent_form_agree': parent_consent_form_agree,
        'terms_privacy_policy_agree': terms_privacy_policy_agree,
        'community_promise_agree': community_promise_agree,
        'email_verification': email_verification,
        'phone_verification': phone_verification,
        'parent_verification': parent_verification,
        'address_verification': address_verification,
        'photo_verification': photo_verification,
        'joined_date': joined_date?.format(),
        'active_status': active_status,
        'address_verification_mode': address_verification_mode,
        'manual_address_code': manual_address_code,
        'manual_address_taken_date': manual_address_taken_date?.format(),
        'manual_address_code_sent_date':
            manual_address_code_sent_date?.format(),
        'mosque_admin': mosque_admin,
        'photo_path': photo_path,
        'selfie_path': selfie_path
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField FIRST_NAME = QueryField(fieldName: "first_name");
  static final QueryField LAST_NAME = QueryField(fieldName: "last_name");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField DOB = QueryField(fieldName: "dob");
  static final QueryField GENDER = QueryField(fieldName: "gender");
  static final QueryField PARENT_EMAIL = QueryField(fieldName: "parent_email");
  static final QueryField HOUSE_NUMBER = QueryField(fieldName: "house_number");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField POSTCODE = QueryField(fieldName: "postcode");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField LATITUDE = QueryField(fieldName: "latitude");
  static final QueryField LONGITUDE = QueryField(fieldName: "longitude");
  static final QueryField PARENT_CONSENT_FORM_AGREE =
      QueryField(fieldName: "parent_consent_form_agree");
  static final QueryField TERMS_PRIVACY_POLICY_AGREE =
      QueryField(fieldName: "terms_privacy_policy_agree");
  static final QueryField COMMUNITY_PROMISE_AGREE =
      QueryField(fieldName: "community_promise_agree");
  static final QueryField EMAIL_VERIFICATION =
      QueryField(fieldName: "email_verification");
  static final QueryField PHONE_VERIFICATION =
      QueryField(fieldName: "phone_verification");
  static final QueryField PARENT_VERIFICATION =
      QueryField(fieldName: "parent_verification");
  static final QueryField ADDRESS_VERIFICATION =
      QueryField(fieldName: "address_verification");
  static final QueryField PHOTO_VERIFICATION =
      QueryField(fieldName: "photo_verification");
  static final QueryField JOINED_DATE = QueryField(fieldName: "joined_date");
  static final QueryField ACTIVE_STATUS =
      QueryField(fieldName: "active_status");
  static final QueryField ADDRESS_VERIFICATION_MODE =
      QueryField(fieldName: "address_verification_mode");
  static final QueryField MANUAL_ADDRESS_CODE =
      QueryField(fieldName: "manual_address_code");
  static final QueryField MANUAL_ADDRESS_TAKEN_DATE =
      QueryField(fieldName: "manual_address_taken_date");
  static final QueryField MANUAL_ADDRESS_CODE_SENT_DATE =
      QueryField(fieldName: "manual_address_code_sent_date");
  static final QueryField MOSQUE_ADMIN = QueryField(fieldName: "mosque_admin");
  static final QueryField PHOTO_PATH = QueryField(fieldName: "photo_path");
  static final QueryField SELFIE_PATH = QueryField(fieldName: "selfie_path");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

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
        key: User.FIRST_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LAST_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PASSWORD,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.DOB,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.GENDER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PARENT_EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.HOUSE_NUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.STREET,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.CITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.POSTCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.COUNTRY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LATITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LONGITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PARENT_CONSENT_FORM_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.TERMS_PRIVACY_POLICY_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.COMMUNITY_PROMISE_AGREE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PHONE_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PARENT_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.ADDRESS_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PHOTO_VERIFICATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.JOINED_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.ACTIVE_STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.ADDRESS_VERIFICATION_MODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.MANUAL_ADDRESS_CODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.MANUAL_ADDRESS_TAKEN_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.MANUAL_ADDRESS_CODE_SENT_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.MOSQUE_ADMIN,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.PHOTO_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.SELFIE_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}

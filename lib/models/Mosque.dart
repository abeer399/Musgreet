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

/** This is an auto generated class representing the Mosque type in your schema. */
@immutable
class Mosque extends Model {
  static const classType = const _MosqueModelType();
  final String id;
  final String mosque_name;
  final String about;
  final bool is_verified;
  final String sect;
  final String mosque_photos_list;
  final String mosque_facilities_list;
  final String contact_description;
  final String phone;
  final String email;
  final String url;
  final String house_number;
  final String street;
  final String city;
  final String postcode;
  final String country;
  final String mosque_admin_id;
  final String latitude;
  final String longitude;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Mosque._internal(
      {@required this.id,
      this.mosque_name,
      this.about,
      this.is_verified,
      this.sect,
      this.mosque_photos_list,
      this.mosque_facilities_list,
      this.contact_description,
      this.phone,
      this.email,
      this.url,
      this.house_number,
      this.street,
      this.city,
      this.postcode,
      this.country,
      this.mosque_admin_id,
      this.latitude,
      this.longitude});

  factory Mosque(
      {String id,
      String mosque_name,
      String about,
      bool is_verified,
      String sect,
      String mosque_photos_list,
      String mosque_facilities_list,
      String contact_description,
      String phone,
      String email,
      String url,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String mosque_admin_id,
      String latitude,
      String longitude}) {
    return Mosque._internal(
        id: id == null ? UUID.getUUID() : id,
        mosque_name: mosque_name,
        about: about,
        is_verified: is_verified,
        sect: sect,
        mosque_photos_list: mosque_photos_list,
        mosque_facilities_list: mosque_facilities_list,
        contact_description: contact_description,
        phone: phone,
        email: email,
        url: url,
        house_number: house_number,
        street: street,
        city: city,
        postcode: postcode,
        country: country,
        mosque_admin_id: mosque_admin_id,
        latitude: latitude,
        longitude: longitude);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Mosque &&
        id == other.id &&
        mosque_name == other.mosque_name &&
        about == other.about &&
        is_verified == other.is_verified &&
        sect == other.sect &&
        mosque_photos_list == other.mosque_photos_list &&
        mosque_facilities_list == other.mosque_facilities_list &&
        contact_description == other.contact_description &&
        phone == other.phone &&
        email == other.email &&
        url == other.url &&
        house_number == other.house_number &&
        street == other.street &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country &&
        mosque_admin_id == other.mosque_admin_id &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Mosque {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("mosque_name=" + "$mosque_name" + ", ");
    buffer.write("about=" + "$about" + ", ");
    buffer.write("is_verified=" +
        (is_verified != null ? is_verified.toString() : "null") +
        ", ");
    buffer.write("sect=" + "$sect" + ", ");
    buffer.write("mosque_photos_list=" + "$mosque_photos_list" + ", ");
    buffer.write("mosque_facilities_list=" + "$mosque_facilities_list" + ", ");
    buffer.write("contact_description=" + "$contact_description" + ", ");
    buffer.write("phone=" + "$phone" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("url=" + "$url" + ", ");
    buffer.write("house_number=" + "$house_number" + ", ");
    buffer.write("street=" + "$street" + ", ");
    buffer.write("city=" + "$city" + ", ");
    buffer.write("postcode=" + "$postcode" + ", ");
    buffer.write("country=" + "$country" + ", ");
    buffer.write("mosque_admin_id=" + "$mosque_admin_id" + ", ");
    buffer.write("latitude=" + "$latitude" + ", ");
    buffer.write("longitude=" + "$longitude");
    buffer.write("}");

    return buffer.toString();
  }

  Mosque copyWith(
      {String id,
      String mosque_name,
      String about,
      bool is_verified,
      String sect,
      String mosque_photos_list,
      String mosque_facilities_list,
      String contact_description,
      String phone,
      String email,
      String url,
      String house_number,
      String street,
      String city,
      String postcode,
      String country,
      String mosque_admin_id,
      String latitude,
      String longitude}) {
    return Mosque(
        id: id ?? this.id,
        mosque_name: mosque_name ?? this.mosque_name,
        about: about ?? this.about,
        is_verified: is_verified ?? this.is_verified,
        sect: sect ?? this.sect,
        mosque_photos_list: mosque_photos_list ?? this.mosque_photos_list,
        mosque_facilities_list:
            mosque_facilities_list ?? this.mosque_facilities_list,
        contact_description: contact_description ?? this.contact_description,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        url: url ?? this.url,
        house_number: house_number ?? this.house_number,
        street: street ?? this.street,
        city: city ?? this.city,
        postcode: postcode ?? this.postcode,
        country: country ?? this.country,
        mosque_admin_id: mosque_admin_id ?? this.mosque_admin_id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude);
  }

  Mosque.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mosque_name = json['mosque_name'],
        about = json['about'],
        is_verified = json['is_verified'],
        sect = json['sect'],
        mosque_photos_list = json['mosque_photos_list'],
        mosque_facilities_list = json['mosque_facilities_list'],
        contact_description = json['contact_description'],
        phone = json['phone'],
        email = json['email'],
        url = json['url'],
        house_number = json['house_number'],
        street = json['street'],
        city = json['city'],
        postcode = json['postcode'],
        country = json['country'],
        mosque_admin_id = json['mosque_admin_id'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'mosque_name': mosque_name,
        'about': about,
        'is_verified': is_verified,
        'sect': sect,
        'mosque_photos_list': mosque_photos_list,
        'mosque_facilities_list': mosque_facilities_list,
        'contact_description': contact_description,
        'phone': phone,
        'email': email,
        'url': url,
        'house_number': house_number,
        'street': street,
        'city': city,
        'postcode': postcode,
        'country': country,
        'mosque_admin_id': mosque_admin_id,
        'latitude': latitude,
        'longitude': longitude
      };

  static final QueryField ID = QueryField(fieldName: "mosque.id");
  static final QueryField MOSQUE_NAME = QueryField(fieldName: "mosque_name");
  static final QueryField ABOUT = QueryField(fieldName: "about");
  static final QueryField IS_VERIFIED = QueryField(fieldName: "is_verified");
  static final QueryField SECT = QueryField(fieldName: "sect");
  static final QueryField MOSQUE_PHOTOS_LIST =
      QueryField(fieldName: "mosque_photos_list");
  static final QueryField MOSQUE_FACILITIES_LIST =
      QueryField(fieldName: "mosque_facilities_list");
  static final QueryField CONTACT_DESCRIPTION =
      QueryField(fieldName: "contact_description");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField URL = QueryField(fieldName: "url");
  static final QueryField HOUSE_NUMBER = QueryField(fieldName: "house_number");
  static final QueryField STREET = QueryField(fieldName: "street");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField POSTCODE = QueryField(fieldName: "postcode");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField MOSQUE_ADMIN_ID =
      QueryField(fieldName: "mosque_admin_id");
  static final QueryField LATITUDE = QueryField(fieldName: "latitude");
  static final QueryField LONGITUDE = QueryField(fieldName: "longitude");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Mosque";
    modelSchemaDefinition.pluralName = "Mosques";

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
        key: Mosque.MOSQUE_NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.ABOUT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.IS_VERIFIED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.bool)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.SECT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_PHOTOS_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_FACILITIES_LIST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.CONTACT_DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.PHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.URL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.HOUSE_NUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.STREET,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.CITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.POSTCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.COUNTRY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.MOSQUE_ADMIN_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.LATITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Mosque.LONGITUDE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MosqueModelType extends ModelType<Mosque> {
  const _MosqueModelType();

  @override
  Mosque fromJson(Map<String, dynamic> jsonData) {
    return Mosque.fromJson(jsonData);
  }
}

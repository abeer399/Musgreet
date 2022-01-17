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

/** This is an auto generated class representing the Language type in your schema. */
@immutable
class Language extends Model {
  static const classType = const _LanguageModelType();
  final String id;
  final String language;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Language._internal({@required this.id, this.language});

  factory Language({String id, String language}) {
    return Language._internal(
        id: id == null ? UUID.getUUID() : id, language: language);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Language && id == other.id && language == other.language;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Language {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("language=" + "$language");
    buffer.write("}");

    return buffer.toString();
  }

  Language copyWith({String id, String language}) {
    return Language(id: id ?? this.id, language: language ?? this.language);
  }

  Language.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        language = json['language'];

  Map<String, dynamic> toJson() => {'id': id, 'language': language};

  static final QueryField ID = QueryField(fieldName: "language.id");
  static final QueryField LANGUAGE = QueryField(fieldName: "language");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Language";
    modelSchemaDefinition.pluralName = "Languages";

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
        key: Language.LANGUAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _LanguageModelType extends ModelType<Language> {
  const _LanguageModelType();

  @override
  Language fromJson(Map<String, dynamic> jsonData) {
    return Language.fromJson(jsonData);
  }
}

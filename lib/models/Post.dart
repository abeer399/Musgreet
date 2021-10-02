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

/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String post;
  final String post_image_path;
  final String description;
  final String visibility;
  final String mosque_id;
  final String user_id;
  final TemporalDate created_date;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Post._internal(
      {@required this.id,
      this.post,
      this.post_image_path,
      this.description,
      this.visibility,
      this.mosque_id,
      this.user_id,
      this.created_date});

  factory Post(
      {String id,
      String post,
      String post_image_path,
      String description,
      String visibility,
      String mosque_id,
      String user_id,
      TemporalDate created_date}) {
    return Post._internal(
        id: id == null ? UUID.getUUID() : id,
        post: post,
        post_image_path: post_image_path,
        description: description,
        visibility: visibility,
        mosque_id: mosque_id,
        user_id: user_id,
        created_date: created_date);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
        id == other.id &&
        post == other.post &&
        post_image_path == other.post_image_path &&
        description == other.description &&
        visibility == other.visibility &&
        mosque_id == other.mosque_id &&
        user_id == other.user_id &&
        created_date == other.created_date;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("post=" + "$post" + ", ");
    buffer.write("post_image_path=" + "$post_image_path" + ", ");
    buffer.write("description=" + "$description" + ", ");
    buffer.write("visibility=" + "$visibility" + ", ");
    buffer.write("mosque_id=" + "$mosque_id" + ", ");
    buffer.write("user_id=" + "$user_id" + ", ");
    buffer.write("created_date=" +
        (created_date != null ? created_date.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Post copyWith(
      {String id,
      String post,
      String post_image_path,
      String description,
      String visibility,
      String mosque_id,
      String user_id,
      TemporalDate created_date}) {
    return Post(
        id: id ?? this.id,
        post: post ?? this.post,
        post_image_path: post_image_path ?? this.post_image_path,
        description: description ?? this.description,
        visibility: visibility ?? this.visibility,
        mosque_id: mosque_id ?? this.mosque_id,
        user_id: user_id ?? this.user_id,
        created_date: created_date ?? this.created_date);
  }

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        post = json['post'],
        post_image_path = json['post_image_path'],
        description = json['description'],
        visibility = json['visibility'],
        mosque_id = json['mosque_id'],
        user_id = json['user_id'],
        created_date = json['created_date'] != null
            ? TemporalDate.fromString(json['created_date'])
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'post': post,
        'post_image_path': post_image_path,
        'description': description,
        'visibility': visibility,
        'mosque_id': mosque_id,
        'user_id': user_id,
        'created_date': created_date?.format()
      };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField POST = QueryField(fieldName: "post");
  static final QueryField POST_IMAGE_PATH =
      QueryField(fieldName: "post_image_path");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField VISIBILITY = QueryField(fieldName: "visibility");
  static final QueryField MOSQUE_ID = QueryField(fieldName: "mosque_id");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static final QueryField CREATED_DATE = QueryField(fieldName: "created_date");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";

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
        key: Post.POST,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.POST_IMAGE_PATH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.VISIBILITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.MOSQUE_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Post.CREATED_DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));
  });
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();

  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}

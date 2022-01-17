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

/** This is an auto generated class representing the PostLike type in your schema. */
@immutable
class PostLike extends Model {
  static const classType = const _PostLikeModelType();
  final String id;
  final String post_id;
  final String user_id;
  final String post_comment_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PostLike._internal(
      {@required this.id, this.post_id, this.user_id, this.post_comment_id});

  factory PostLike(
      {String id, String post_id, String user_id, String post_comment_id}) {
    return PostLike._internal(
        id: id == null ? UUID.getUUID() : id,
        post_id: post_id,
        user_id: user_id,
        post_comment_id: post_comment_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostLike &&
        id == other.id &&
        post_id == other.post_id &&
        user_id == other.user_id &&
        post_comment_id == other.post_comment_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PostLike {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("post_id=" + "$post_id" + ", ");
    buffer.write("user_id=" + "$user_id" + ", ");
    buffer.write("post_comment_id=" + "$post_comment_id");
    buffer.write("}");

    return buffer.toString();
  }

  PostLike copyWith(
      {String id, String post_id, String user_id, String post_comment_id}) {
    return PostLike(
        id: id ?? this.id,
        post_id: post_id ?? this.post_id,
        user_id: user_id ?? this.user_id,
        post_comment_id: post_comment_id ?? this.post_comment_id);
  }

  PostLike.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        post_id = json['post_id'],
        user_id = json['user_id'],
        post_comment_id = json['post_comment_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'post_id': post_id,
        'user_id': user_id,
        'post_comment_id': post_comment_id
      };

  static final QueryField ID = QueryField(fieldName: "postLike.id");
  static final QueryField POST_ID = QueryField(fieldName: "post_id");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static final QueryField POST_COMMENT_ID =
      QueryField(fieldName: "post_comment_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PostLike";
    modelSchemaDefinition.pluralName = "PostLikes";

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
        key: PostLike.POST_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostLike.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostLike.POST_COMMENT_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _PostLikeModelType extends ModelType<PostLike> {
  const _PostLikeModelType();

  @override
  PostLike fromJson(Map<String, dynamic> jsonData) {
    return PostLike.fromJson(jsonData);
  }
}

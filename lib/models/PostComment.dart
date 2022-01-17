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

/** This is an auto generated class representing the PostComment type in your schema. */
@immutable
class PostComment extends Model {
  static const classType = const _PostCommentModelType();
  final String id;
  final String comment;
  final String parent_id;
  final String post_id;
  final String user_id;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PostComment._internal(
      {@required this.id,
      this.comment,
      this.parent_id,
      this.post_id,
      this.user_id});

  factory PostComment(
      {String id,
      String comment,
      String parent_id,
      String post_id,
      String user_id}) {
    return PostComment._internal(
        id: id == null ? UUID.getUUID() : id,
        comment: comment,
        parent_id: parent_id,
        post_id: post_id,
        user_id: user_id);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostComment &&
        id == other.id &&
        comment == other.comment &&
        parent_id == other.parent_id &&
        post_id == other.post_id &&
        user_id == other.user_id;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PostComment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("comment=" + "$comment" + ", ");
    buffer.write("parent_id=" + "$parent_id" + ", ");
    buffer.write("post_id=" + "$post_id" + ", ");
    buffer.write("user_id=" + "$user_id");
    buffer.write("}");

    return buffer.toString();
  }

  PostComment copyWith(
      {String id,
      String comment,
      String parent_id,
      String post_id,
      String user_id}) {
    return PostComment(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        parent_id: parent_id ?? this.parent_id,
        post_id: post_id ?? this.post_id,
        user_id: user_id ?? this.user_id);
  }

  PostComment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        comment = json['comment'],
        parent_id = json['parent_id'],
        post_id = json['post_id'],
        user_id = json['user_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
        'parent_id': parent_id,
        'post_id': post_id,
        'user_id': user_id
      };

  static final QueryField ID = QueryField(fieldName: "postComment.id");
  static final QueryField COMMENT = QueryField(fieldName: "comment");
  static final QueryField PARENT_ID = QueryField(fieldName: "parent_id");
  static final QueryField POST_ID = QueryField(fieldName: "post_id");
  static final QueryField USER_ID = QueryField(fieldName: "user_id");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PostComment";
    modelSchemaDefinition.pluralName = "PostComments";

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
        key: PostComment.COMMENT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComment.PARENT_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComment.POST_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PostComment.USER_ID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _PostCommentModelType extends ModelType<PostComment> {
  const _PostCommentModelType();

  @override
  PostComment fromJson(Map<String, dynamic> jsonData) {
    return PostComment.fromJson(jsonData);
  }
}
